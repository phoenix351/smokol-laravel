<?php

use App\Http\Controllers\MasterBarangController;
use App\Http\Controllers\MasterJabatanController;
use App\Http\Controllers\MasterRuanganController;
use App\Http\Controllers\MasterSistemOperasiController;
use App\Http\Controllers\BarangController;
use App\Http\Controllers\BarangUserController;
use App\Http\Controllers\BastController;
use App\Http\Controllers\HistoryBarangUserController;
use App\Http\Controllers\LaporanController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\MaintenanceController;
use App\Http\Controllers\MasterPenanggungJawabController;
use App\Http\Controllers\MasterPerusahaanController;
use App\Http\Controllers\MasterPjPerusahaanController;
use App\Http\Controllers\UserController;
use App\Models\MasterBarang;
use App\Models\MasterJabatan;
use App\Models\MasterPenanggungJawab;
use App\Models\MasterRuangan;
use App\Models\MasterSistemOperasi;
use App\Models\User;
use Illuminate\Support\Facades\Log;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/




Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    //route master barang
    route::get('/admin/master-barang', [MasterBarangController::class, 'index'])->name('admin.master.barang');
    Route::patch('/admin/master-barang', [MasterBarangController::class, 'update'])->name('master_barang.update');
    Route::post('/admin/master-barang', [MasterBarangController::class, 'store'])->name('master_barang.store');
    Route::delete('/admin/master-barang', [MasterBarangController::class, 'destroy'])->name('master_barang.destroy');

    //route master jabatan
    route::get('/admin/master-jabatan', [MasterJabatanController::class, 'index'])->name('admin.master.jabatan');
    Route::patch('/admin/master-jabatan', [MasterJabatanController::class, 'update'])->name('master_jabatan.update');
    Route::post('/admin/master-jabatan', [MasterJabatanController::class, 'store'])->name('master_jabatan.store');
    Route::delete('/admin/master-jabatan', [MasterJabatanController::class, 'destroy'])->name('master_jabatan.destroy');

    //route master ruangan
    route::get('/admin/master-ruangan', [MasterRuanganController::class, 'index'])->name('admin.master.ruangan');
    Route::patch('/admin/master-ruangan', [MasterRuanganController::class, 'update'])->name('master_ruangan.update');
    Route::post('/admin/master-ruangan', [MasterRuanganController::class, 'store'])->name('master_ruangan.store');
    Route::delete('/admin/master-ruangan', [MasterRuanganController::class, 'destroy'])->name('master_ruangan.destroy');

    //route master perusahaan
    route::get('/admin/master/perusahaan', [MasterPerusahaanController::class, 'index'])->name('admin.master.perusahaan');
    Route::patch('/admin/master/perusahaan', [MasterPerusahaanController::class, 'update'])->name('master_perusahaan.update');
    Route::post('/admin/master/perusahaan', [MasterPerusahaanController::class, 'store'])->name('master_perusahaan.store');
    Route::delete('/admin/master/perusahaan/{id}', [MasterPerusahaanController::class, 'destroy'])->name('master_perusahaan.destroy');

    //route master penanggungjawab perusahaan
    route::get('/admin/master/penanggungjawab', [MasterPenanggungJawabController::class, 'index'])->name('admin.master.penanggungjawab');
    Route::patch('/admin/master/penanggungjawab', [MasterPenanggungJawabController::class, 'update'])->name('admin.master.penanggungjawab.update');
    Route::post('/admin/master/penanggungjawab', [MasterPenanggungJawabController::class, 'store'])->name('admin.master.penanggungjawab.store');
    Route::delete('/admin/master/penanggungjawab/{id}', [MasterPenanggungJawabController::class, 'destroy'])->name('admin.master.penanggungjawab.destroy');


    // route api for ruangan
    route::get('/api/master/ruangan/nama', function () {
        $namaList = MasterRuangan::select(["nama"])->groupBy(['nama'])->get();
        return response()->json([$namaList]);
    })->name('admin.master.ruangan.nama');

    route::get('/api/bast', [BastController::class, 'get_bast_by_barangId'])->name('bast');
    route::post('/api/bast/upload', [BastController::class, 'upload'])->name('bast.upload');
    
    //route master kelola barang
    route::get('/admin/barang', [BarangController::class, 'index'])->name('admin.kelola.history_barang.index');
    Route::patch('/admin/barang', [BarangController::class, 'update'])->name('admin.kelola.history_barang.update');
    Route::post('/admin/barang', [BarangController::class, 'store'])->name('admin.kelola.history_barang.store');
    Route::delete('/admin/barang', [BarangController::class, 'destroy'])->name('admin.kelola.history_barang.destroy');
    
    route::get('/api/barang', [BarangController::class, 'fetch'])->name('api.barang');


    //route master sistem operasi
    route::get('/admin/master-sistem-operasi', [MasterSistemOperasiController::class, 'index'])->name('admin.master.sistem_operasi');
    Route::patch('/admin/master-sistem-operasi', [MasterSistemOperasiController::class, 'update'])->name('admin.master.sistem_operasi.update');
    Route::post('/admin/master-sistem-operasi', [MasterSistemOperasiController::class, 'store'])->name('admin.master.sistem_operasi.store');
    Route::delete('/admin/master-sistem-operasi', [MasterSistemOperasiController::class, 'destroy'])->name('admin.master.sistem_operasi.destroy');
    // route api for arsitektur sistem operasi
    route::get('api/master/sistem_operasi/arsitektur', function () {
        $arsitektur_list = MasterSistemOperasi::select('arsitektur')->groupBy('arsitektur')->get();
        return response()->json([$arsitektur_list]);
    })->name('admin.master.sistem_operasi.arsitektur');

    // master perusahaan
    Route::get('api/master/perusahaan', [MasterPerusahaanController::class, 'fetch'])->name('master.perusahaan.fetch');
    Route::get('api/master/penanggungjawab', [MasterPenanggungJawabController::class, 'fetch'])->name('master.penanggungjawab.fetch');
    Route::get('api/master/perusahaan/pj', [MasterPjPerusahaanController::class, 'fetch'])->name('master.perusahaan.pj.fetch');
    Route::get('api/maintenance/status', [MaintenanceController::class, 'fetch_status'])->name('maintenance.status.fetch');

    // route api for master barang just for admin
    route::get('/api/users', function () {
        $users = User::select('id', 'nama_lengkap')->get();
        return response()->json([$users]);
    })->name('users.get');
    route::get('/api/jenis', function () {
        $jenisList = MasterBarang::select(["jenis"])->groupBy(['jenis'])->get();
        return response()->json([$jenisList]);
    })->name('jenis.get');
    route::get('/api/merk', function () {
        $merkList = MasterBarang::select(["merk"])->groupBy(['merk'])->get();
        return response()->json([$merkList]);
    })->name('merk.get');
    route::get('/api/tipe', function () {
        $tipeList = MasterBarang::select(["tipe"])->groupBy(['tipe'])->get();
        return response()->json([$tipeList]);
    })->name('tipe.get');
    route::get('/api/lokasi', function () {
        $ruanganList = MasterRuangan::select('nama', 'id')->get();
        return response()->json([$ruanganList]);
    })->name('lokasi.get');
    route::get('/api/os', function () {
        $osList = MasterSistemOperasi::selectRaw('concat(nama, " ", arsitektur) as nama_os, id')->get();
        return response()->json($osList);
    })->name('os.get');

    // route api for jabatan
    route::get('/api/master/jabatan', function () {
        $jabatan_list = MasterJabatan::select('id', 'nama', 'tingkat')->get();
        return response()->json($jabatan_list, 200);
    })->name('api.master.jabatan');
    route::get('/api/master/jabatan/nama', function () {
        $namaList = MasterJabatan::select(["nama"])->groupBy(['nama'])->get();
        return response()->json([$namaList]);
    })->name('admin.master.jabatan.nama');
    route::get('/api/master/jabatan/jenis', function () {
        $jenisList = MasterJabatan::select(["jenis"])->groupBy(['jenis'])->get();
        return response()->json([$jenisList]);
    })->name('admin.master.jabatan.jenis');

    route::get('/api/master/jabatan/tingkat', function () {
        $tingkatList = MasterJabatan::select(["tingkat"])->groupBy(['tingkat'])->get();
        return response()->json([$tingkatList]);
    })->name('admin.master.jabatan.tingkat');

    route::get('/admin/master/users', [UserController::class, 'index'])->name('admin.master.users');

    Route::patch('/admin/master/users', [UserController::class, 'update'])->name('admin.users.update');
    Route::post('/admin/master/users', [UserController::class, 'store'])->name('admin.users.store');
    Route::delete('/admin/master/users', [UserController::class, 'delete'])->name('admin.users.delete');



    route::get('/dashboard', function () {
        Log::info('Showing the user profile for user');

        $kondisi = DB::table('barang')
            ->select(
                DB::raw('COUNT(CASE WHEN kondisi = "Baik" THEN 1 END) as baik'),
                DB::raw('COUNT(CASE WHEN kondisi = "Rusak Ringan" THEN 1 END) as rusakRingan'),
                DB::raw('COUNT(CASE WHEN kondisi = "Rusak Berat" THEN 1 END) as rusakBerat'),
                DB::raw('COUNT(kondisi) as jumlah')
            )
            ->first();

        $ruangan_summary = DB::table('barang')
            ->select('ruangan_id', 'master_ruangan.nama as label', DB::raw('count(*) as value'))
            ->join('master_ruangan', 'barang.ruangan_id', '=', 'master_ruangan.id')
            ->groupBy('ruangan_id', 'master_ruangan.nama')
            ->orderBy('value')
            ->get();
        $jenis_summary = DB::table('master_barang')
            ->select('jenis as label', DB::raw('count(*) as value'))
            ->groupBy('label')
            ->orderBy('value')
            ->get();

        // $kondisi_total = 100;
        $response = ['kondisi' => $kondisi, 'ruangan_summary' => $ruangan_summary, 'jenis_summary' => $jenis_summary];
        // return response()->json($response, 200);
        return Inertia::render('Dashboard', $response);
    })->name('dashboard');


    route::get('/', function () {
        if (auth()->user()->role == 'basic') {

            return to_route('barang');
        }
        return to_route('dashboard');
    })->name('root');


    route::get('/statistics', function () {
        return Inertia::render('Statistics');
    })->name('statistics');



    //route barang untuk user
    route::get('/barang', [BarangUserController::class, 'index'])->name('barang');
    Route::patch('/barang', [BarangController::class, 'update'])->name('barang.update');
    Route::post('/barang', [BarangController::class, 'store'])->name('barang.store');
    Route::delete('/barang', [BarangController::class, 'destroy'])->name('barang.destroy');

    Route::get('/files', [BastController::class, 'show_file'])->name('file.show');

    //route untuk pengajuan
    route::get('/pengajuan', [MaintenanceController::class, 'index'])->name('pengajuan');
    route::get('/pengajuan/riwayat/{sequence_id}', [MaintenanceController::class, 'riwayat'])->name('pengajuan.riwayat');


    Route::post('/maintenance/store', [MaintenanceController::class, 'store'])->name('maintenance.store');
    Route::post('/maintenance/update', [MaintenanceController::class, 'update'])->name('maintenance.update');
    Route::post('/maintenance/status/update', [MaintenanceController::class, 'status_update'])->name('maintenance.status.update');
    Route::post('/maintenance/status/finish-penyedia', [MaintenanceController::class, 'finish_penyedia'])->name('maintenance.status.finish-penyedia');
    Route::post('/maintenance/status/finish-ipds', [MaintenanceController::class, 'finish_ipds'])->name('maintenance.status.finish-ipds');
    Route::post('/maintenance/status/kembali-pengguna', [MaintenanceController::class, 'kembali_pengguna'])->name('maintenance.status.kembali-pengguna');
    Route::post('/maintenance/check', [MaintenanceController::class, 'check'])->name('maintenance.check');
    Route::post('/maintenance/inspect/ipds', [MaintenanceController::class, 'PemeriksaanIPDS'])->name('maintenance.inspect.ipds.store');
    Route::post('/maintenance/inspect/bmn', [MaintenanceController::class, 'PemeriksaanBMN'])->name('maintenance.inspect.bmn.store');
    Route::post('/maintenance/inspect/pbj-ppk', [MaintenanceController::class, 'PemeriksaanPBJ_PPK'])->name('maintenance.inspect.pbj-ppk.store');

    route::get('/admin/kelola-pengajuan', [MaintenanceController::class, 'admin'])->name('admin.kelola.pengajuan');
    route::get('/admin/pengajuan', [MaintenanceController::class, 'pengajuan_fetch'])->name('admin.pengajuan.fetch');
    route::post('/admin/pengajuan', [MaintenanceController::class, 'pengajuan_approve'])->name('admin.pengajuan.approve');

    route::get('/admin/laporan/dbr/cetak/{id_ruangan}', [LaporanController::class, 'cetak_dbr'])->name('admin.laporan.dbr.cetak');
    route::get('/admin/laporan/dbr/fetch/{id_ruangan}', [LaporanController::class, 'fetch_dbr'])->name('admin.laporan.dbr.fetch');
    route::get('/admin/laporan/dbr', [LaporanController::class, 'dbr'])->name('admin.laporan.dbr');

    Route::get('/editable', function () {
        return Inertia::render('Editable');
    });
});

require __DIR__ . '/auth.php';
