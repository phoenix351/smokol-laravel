# Laporan Analisis & Audit Teknis: Proyek SMOKOL

## 1. Gambaran Umum Aplikasi
*   **Tujuan Utama**: Aplikasi ini berfungsi sebagai **Sistem Manajemen Operasional Komputer & Logistik** (SMOKOL), yang secara khusus menangani inventarisasi aset TI dan manajemen pemeliharaan (maintenance) perangkat. Berdasarkan sampel data, aplikasi ini digunakan oleh instansi pemerintah (BPS) untuk melacak perangkat seperti PC, Laptop, dan printer.
*   **Fitur Utama**:
    *   **Manajemen Inventaris**: Pendataan barang (PC, Laptop, OS, Ruangan).
    *   **Workflow Pemeliharaan**: Alur pengajuan perbaikan dari user hingga selesai diperbaiki oleh vendor/penyedia.
    *   **Pemeriksaan Teknis**: Modul pemeriksaan oleh tim internal (IPDS/BMN).
    *   **Pelaporan (DBR)**: Pembuatan Daftar Barang Ruangan (DBR) dalam format PDF.
    *   **Dashboard Statistik**: Visualisasi kondisi barang dan sebaran aset per ruangan menggunakan grafik.
*   **Role User**:
    *   `admin`: Akses penuh ke master data dan manajemen seluruh pengajuan.
    *   `Tim IPDS`: Tim teknis yang melakukan verifikasi kerusakan.
    *   `Tim BMN`: Pengelola aset (Barang Milik Negara).
    *   `basic`: User umum yang memegang aset dan bisa mengajukan perbaikan.

## 2. Arsitektur Sistem
*   **Teknologi Utama**:
    *   **Backend**: Laravel 10 (PHP 8.1+)
    *   **Frontend**: ReactJS 18 dengan TypeScript.
    *   **Penghubung**: **Inertia.js** (Menghubungkan Laravel & React tanpa perlu membangun REST API terpisah).
    *   **Styling**: Tailwind CSS & Ant Design (UI Library).
*   **Pola Arsitektur**:
    *   **Monolithic Hybrid**: Kode frontend berada di dalam direktori Laravel (`resources/js`), namun berjalan sebagai Single Page Application (SPA).
    *   **MVC Modifikasi**: Laravel menangani Controller dan Model, sementara View digantikan oleh komponen React.
*   **Struktur Folder Penting**:
    *   `app/Http/Controllers`: Logika bisnis (Alur kompleks ada di `MaintenanceController.php`).
    *   `resources/js/Pages`: Komponen halaman React.
    *   `resources/js/Components`: Komponen UI yang dapat digunakan kembali.

## 3. Alur Bisnis (Flow) Pemeliharaan
Aplikasi ini memiliki alur perbaikan barang yang cukup detail:
1.  **Pengajuan**: User (`basic`) memilih barang yang rusak dan mengunggah foto kerusakan.
2.  **Verifikasi BMN**: Admin/BMN menyetujui pengajuan secara administratif.
3.  **Pemeriksaan IPDS**: Tim IT (IPDS) memeriksa teknis. Status ditentukan: *Rusak Ringan*, *Rusak Berat*, atau *Bisa Diperbaiki Langsung*.
4.  **Penanganan Vendor**: Jika butuh vendor, status berubah ke "Menunggu Diambil Penyedia".
5.  **Penyelesaian**: Vendor mengembalikan barang -> IPDS verifikasi ulang -> Barang kembali ke user.
*   **State Management**: Menggunakan state internal React dan data yang di-pass dari Inertia secara server-side.

## 4. Analisis Database
*   **Tabel Utama**:
    *   `master_barang`: Katalog tipe barang (Template).
    *   `barang`: Instance fisik aset (Serial Number, NUP, Lokasi).
    *   `maintenance_sequences`: Rekaman satu siklus perbaikan.
    *   `maintenances`: Log perubahan status (history) dalam satu sequence.
*   **Relasi**:
    *   Relasi antara `barang` dan `maintenance_sequences` menggunakan `barang_id`.
    *   `maintenance_sequences` bertindak sebagai *parent* untuk banyak log di tabel `maintenances` (One-to-Many).
*   **Potensi Masalah**:
    *   **Hardcoded Status**: Status menggunakan kode string (`0`, `1`, `2`, dll) yang tersebar di kode, bukan Enum.
    *   **Data Integrity**: Penggunaan SQL manual/Query Builder di beberapa tempat mungkin melewatkan proteksi level model (seperti event listeners).

## 5. Analisis Kode
*   **Coding Style**:
    *   Konsisten menggunakan Controller-based logic dengan Inertia.
    *   Frontend menggunakan TypeScript, yang meminimalkan runtime error.
*   **Potensi Code Smell**:
    *   **Fat Controllers**: `MaintenanceController.php` sangat panjang (>600 baris) dengan logika percabangan status yang rumit.
    *   **Placeholder Unik**: Terdapat pesan error/log menggunakan kata-kata non-formal (Contoh: `"An asu occurred"`, `"asulah"`).
    *   **Try-Catch Duplikasi**: Banyak blok `try-catch` yang identik di setiap method controller, melanggar prinsip DRY (Don't Repeat Yourself).

## 6. Identifikasi Bug & Potensi Issue
*   **Security**:
    *   **SQL Injection**: Sebagian besar menggunakan Eloquent, namun ada beberapa `whereRaw` dan query manual yang perlu divalidasi ulang keamanannya.
    *   **Auth**: Proteksi middleware `auth` sudah diterapkan pada hampir semua route utama.
*   **Performance**:
    *   **N+1 Query**: Pada pengambilan data pengajuan, terdapat potensi query berulang di dalam transformator data.
    *   **Heavy Joins**: Query dashboard menggunakan banyak `DB::raw` yang bisa melambat seiring bertambahnya data.
*   **Error Handling**:
    *   Beberapa catch block hanya mengembalikan pesan string sederhana tanpa logging yang memadai ke sistem (seperti `Log::error()`).

## 7. Dependency & Konfigurasi
*   **Library Utama**:
    *   **Backend**: `inertiajs/inertia-laravel`, `barryvdh/laravel-dompdf`, `tightenco/ziggy`.
    *   **Frontend**: `antd` (Ant Design), `echarts-for-react`, `@react-pdf/renderer`.
*   **Versi**: Laravel 10, React 18, Vite 4.
*   **Konfigurasi**: Menggunakan `.env` standar Laravel dengan integrasi Vite.

## 8. Rekomendasi Perbaikan
*   **Prioritas Tinggi**:
    1.  **Refactoring Status**: Implementasikan **PHP Enum** untuk `MaintenanceStatus` untuk menggantikan angka hardcoded.
    2.  **Cleaning**: Hapus semua string non-formal/debug (`asu`, dll) dari codebase.
    3.  **Service Layer**: Pindahkan logika workflow dari `MaintenanceController` ke `MaintenanceService`.
*   **Refactoring**:
    1.  Gunakan **Eloquent API Resources** untuk standarisasi format data dari backend ke frontend.
    2.  Implementasikan **Soft Deletes** pada tabel utama agar riwayat data tidak hilang permanen.
*   **Best Practice**:
    1.  Tambahkan integrasi **Sentry** atau **Log Viewer** untuk memantau error di produksi.
    2.  Optimasi query database menggunakan `eager loading` (method `with()`).

## 9. Cara Menjalankan Aplikasi
1.  **Instalasi Backend**:
    ```bash
    composer install
    cp .env.example .env
    php artisan key:generate
    # Konfigurasi database di .env
    php artisan migrate
    ```
2.  **Instalasi Frontend**:
    ```bash
    npm install
    npm run dev
    ```
3.  **Menjalankan**:
    *   Buka terminal 1: `php artisan serve`
    *   Buka terminal 2: `npm run dev`
    *   Akses di browser: `http://localhost:8000`
