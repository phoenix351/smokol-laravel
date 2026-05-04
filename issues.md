# 🐛 Bug & Issue Report (Developer Ready)

## Issue 1: Penggunaan Magic Numbers untuk Status Pemeliharaan
### 🧭 Prioritas
**High**

### 📍 Lokasi File
- **Backend:** `app/Http/Controllers/MaintenanceController.php`
- **Model:** `app/Models/Maintenance.php`
- **Context:** Logika percabangan status di method `pengajuan_approve`, `status_update`, dan `PemeriksaanIPDS`.

### ❗ Deskripsi Masalah
Aplikasi menggunakan string angka hardcoded (seperti `"0"`, `"1"`, `"2"`, `"5"`, `"6"`) untuk menentukan alur kerja pemeliharaan. Hal ini membuat kode sulit dibaca (apa arti status "5"?) dan sulit untuk dimodifikasi jika ada perubahan alur bisnis.

### 💥 Dampak
Developer baru harus menebak-nebak arti angka status. Jika salah mengetik angka (misal "0" menjadi 0), logika validasi bisa gagal secara diam-diam.

### 🔍 Akar Masalah Teknis
Tidak adanya abstraksi (seperti Enum atau Konstanta) yang merepresentasikan status pemeliharaan di level aplikasi.

### 🧪 Cara Reproduce & Contoh Kasus
1. Buka `MaintenanceController.php`.
2. Cari baris yang berisi `kode_status == "0"`.
3. Tanpa dokumentasi eksternal, arti `"0"` tidak diketahui secara langsung dari kode.

### ❌ Kode Bermasalah (Before)
```php
// app/Http/Controllers/MaintenanceController.php
public function pengajuan_approve(Request $request) {
    $approved = [
        'sequence_id' => $request['sequence_id'],
        'kode_status' => $request['kode_status'] == "0" ? "1" : "2",
    ];
    // ...
}
```

### ✅ Kode Solusi (After)
1. Buat Enum di `app/Enums/MaintenanceStatus.php`:
```php
namespace App\Enums;

enum MaintenanceStatus: string {
    case CREATED = '0';
    case BMN_APPROVED = '1';
    case IPDS_APPROVED = '2';
    case PROVIDER_PROCESS = '4';
    case FINISHED_IPDS_CHECK = '5';
    case RETURNED = '10';
}
```
2. Update Controller:
```php
use App\Enums\MaintenanceStatus;

public function pengajuan_approve(Request $request) {
    $approved = [
        'sequence_id' => $request['sequence_id'],
        'kode_status' => ($request['kode_status'] === MaintenanceStatus::CREATED->value) 
                         ? MaintenanceStatus::BMN_APPROVED->value 
                         : MaintenanceStatus::IPDS_APPROVED->value,
    ];
}
```

---

## Issue 2: String Tidak Profesional dan Penanganan Error yang Buruk
### 🧭 Prioritas
**Medium**

### 📍 Lokasi File
- **Backend:** `app/Http/Controllers/BarangController.php`, `app/Http/Controllers/MaintenanceController.php`
- **Method:** `update()`, `status_update()`, `finish_penyedia()`

### ❗ Deskripsi Masalah
Terdapat string kata-kata kasar/tidak profesional (`"asu"`, `"asulah"`, `"An asu occurred"`) di dalam blok `catch` dan respon JSON. Selain tidak profesional, pesan error ini tidak memberikan informasi teknis yang berguna bagi developer.

### 💥 Dampak
Citra profesionalitas aplikasi buruk di mata klien/auditor. Developer kesulitan menelusuri bug karena error asli tidak di-log, melainkan hanya diganti dengan string "asulah".

### 🔍 Akar Masalah Teknis
Penggunaan placeholder string sembarangan saat fase pengembangan yang terbawa ke kode produksi dan kurangnya implementasi `Illuminate\Support\Facades\Log`.

### 🧪 Cara Reproduce & Contoh Kasus
1. Paksa error pada update barang (misal: kirim ID yang tidak ada).
2. Lihat respon JSON yang diterima frontend.
3. Observasi pesan: `"message": "An asu occurred"`.

### ❌ Kode Bermasalah (Before)
```php
// app/Http/Controllers/BarangController.php
catch (QueryException $e) {
    $response = [
        'message' => 'An asu occurred',
        'error' => $e->getMessage(),
    ];
    return response()->json($response, 429);
}
```

### ✅ Kode Solusi (After)
```php
use Illuminate\Support\Facades\Log;

catch (QueryException $e) {
    // Log error secara teknis untuk developer
    Log::error("Barang Update Database Error: " . $e->getMessage(), [
        'request' => $request->all(),
        'trace' => $e->getTraceAsString()
    ]);

    // Respon user-friendly untuk frontend
    return response()->json([
        'message' => 'Terjadi kesalahan sistem saat memperbarui data barang.',
        'debug' => config('app.debug') ? $e->getMessage() : null
    ], 500);
}
```

---

## Issue 3: N+1 Query & Manual Join pada Daftar Pemeliharaan
### 🧭 Prioritas
**High**

### 📍 Lokasi File
- **Backend:** `app/Http/Controllers/MaintenanceController.php`
- **Method:** `index()`

### ❗ Deskripsi Masalah
Method `index()` menggunakan `join` manual yang sangat kompleks dan `whereRaw` subquery untuk mendapatkan status terakhir dari setiap pengajuan. Ini melanggar prinsip Eloquent dan akan menjadi sangat lambat (performa drop) seiring bertambahnya jumlah baris di tabel `maintenances`.

### 💥 Dampak
Waktu load halaman pemeliharaan meningkat secara eksponensial. Database server akan mengalami load tinggi karena query subselect dijalankan berulang kali.

### 🔍 Akar Masalah Teknis
Tidak memanfaatkan fitur `hasOne(...)->latestOfMany()` dari Eloquent untuk mengambil record status terbaru.

### 🧪 Cara Reproduce & Contoh Kasus
1. Aktifkan Database Query Log.
2. Buka halaman `/maintenance`.
3. Lihat jumlah query yang dijalankan. Query menggunakan subquery `(SELECT id FROM maintenances ... ORDER BY id DESC LIMIT 1)`.

### ❌ Kode Bermasalah (Before)
```php
// app/Http/Controllers/MaintenanceController.php
->join('maintenances', function ($join) {
    $join->on('maintenances.sequence_id', '=', 'maintenance_sequences.id')
        ->whereRaw('maintenances.id = (
        SELECT id FROM maintenances as sub_maintenances
        WHERE sub_maintenances.sequence_id = maintenances.sequence_id
        ORDER BY sub_maintenances.id DESC
        LIMIT 1
    )');
})
```

### ✅ Kode Solusi (After)
1. Tambahkan relasi di `app/Models/MaintenanceSequence.php`:
```php
public function latestMaintenance() {
    return $this->hasOne(Maintenance::class, 'sequence_id')->latestOfMany();
}
```
2. Update Controller:
```php
public function index() {
    $maintenance_list = MaintenanceSequence::with([
        'latestMaintenance.Status', 
        'Barang.Barang'
    ])
    ->where('users_id', auth()->id())
    ->get();

    return Inertia::render('Maintenance', [
        'maintenance_list' => $maintenance_list
    ]);
}
```

---

## Issue 4: Penghapusan Data Permanen (Missing Soft Deletes)
### 🧭 Prioritas
**Medium**

### 📍 Lokasi File
- **Backend:** `app/Models/Barang.php`, `app/Models/MaintenanceSequence.php`
- **Migration:** `database/migrations/`

### ❗ Deskripsi Masalah
Aksi `destroy` pada controller menghapus data langsung dari database (`hard delete`). Untuk sistem manajemen aset, ini berbahaya karena data yang dihapus (misal: laptop yang sudah pensiun atau pengajuan salah) tidak bisa dilacak kembali riwayatnya.

### 💥 Dampak
Kehilangan data historis secara permanen. Jika admin tidak sengaja menghapus aset, tidak ada cara untuk me-restore selain dari backup database.

### 🔍 Akar Masalah Teknis
Tidak diimplementasikannya trait `Illuminate\Database\Eloquent\SoftDeletes`.

### 🧪 Cara Reproduce & Contoh Kasus
1. Login sebagai Admin.
2. Hapus satu item barang.
3. Periksa tabel `barang` di database. Record tersebut hilang sepenuhnya.

### ❌ Kode Bermasalah (Before)
```php
// app/Http/Controllers/BarangController.php
$updateRecord = Barang::findOrFail($request->query('id'));
$updateRecord->delete(); // Hard delete
```

### ✅ Kode Solusi (After)
1. Tambahkan kolom di migration:
```php
Schema::table('barang', function (Blueprint $table) {
    $table->softDeletes();
});
```
2. Tambahkan Trait di Model `app/Models/Barang.php`:
```php
use Illuminate\Database\Eloquent\SoftDeletes;

class Barang extends Model {
    use SoftDeletes;
    // ...
}
```
3. Controller sekarang akan otomatis melakukan soft delete saat memanggil `$updateRecord->delete()`.

---

## Issue 5: Pelanggaran Keamanan Folder Storage (Direct Public Path)
### 🧭 Prioritas
**High**

### 📍 Lokasi File
- **Backend:** `app/Http/Controllers/MaintenanceController.php`
- **Frontend:** `resources/js/Pages/Admin/KelolaPengajuan.tsx`

### ❗ Deskripsi Masalah
Aplikasi menyimpan gambar keluhan langsung ke `public/images/problems`. Ini berbahaya karena folder `public` Laravel seharusnya hanya untuk aset statis (CSS/JS). File unggahan user harus berada di `storage/app/public` dan diakses melalui *symbolic link*.

### 💥 Dampak
Potensi file overwrite jika nama file sama, dan risiko keamanan jika user mengunggah script eksekusi (PHP) ke folder yang bisa diakses publik secara langsung.

### 🔍 Akar Masalah Teknis
Penggunaan path `public/images/...` di dalam fungsi `store()` pada Controller.

### ❌ Kode Bermasalah (Before)
```php
$path = $request->file('problem_img_path')->store('public/images/problems');
// Hasil: Disimpan di folder yang bisa diakses langsung via URL tanpa proteksi
```

### ✅ Kode Solusi (After)
1. Gunakan disk `public`:
```php
$path = $request->file('problem_img_path')->store('problems', 'public');
```
2. Jalankan `php artisan storage:link`.
3. Akses di frontend menggunakan helper `Storage::url($path)` (sudah mulai diterapkan di beberapa bagian, perlu diseragamkan).
