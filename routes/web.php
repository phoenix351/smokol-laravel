<?php

use App\Http\Controllers\MasterBarangController;
use App\Http\Controllers\MasterJabatanController;
use App\Http\Controllers\MasterRuanganController;
use App\Http\Controllers\MasterSistemOperasiController;
use App\Http\Controllers\BarangController;
use App\Http\Controllers\BarangUserController;
use App\Http\Controllers\BastController;
use App\Http\Controllers\HistoryBarangUserController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\MaintenanceController;

use App\Models\MasterBarang;
use App\Models\MasterJabatan;
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
    route::get('/admin/master-barang', function () {
        return Inertia::render('Admin/MasterBarang', ['master_barang' => MasterBarang::all()]);
    })->name('admin.master.barang');
    Route::patch('/admin/master-barang', [MasterBarangController::class, 'update'])->name('master_barang.update');
    Route::post('/admin/master-barang', [MasterBarangController::class, 'store'])->name('master_barang.store');
    Route::delete('/admin/master-barang', [MasterBarangController::class, 'destroy'])->name('master_barang.destroy');

    //route master jabatan
    route::get('/admin/master-jabatan', function () {
        return Inertia::render('Admin/MasterJabatan', ['master_jabatan' => MasterJabatan::all()]);
    })->name('admin.master.jabatan');
    Route::patch('/admin/master-jabatan', [MasterJabatanController::class, 'update'])->name('master_jabatan.update');
    Route::post('/admin/master-jabatan', [MasterJabatanController::class, 'store'])->name('master_jabatan.store');
    Route::delete('/admin/master-jabatan', [MasterJabatanController::class, 'destroy'])->name('master_jabatan.destroy');

    //route master ruangan
    route::get('/admin/master-ruangan', [MasterRuanganController::class, 'index'])->name('admin.master.ruangan');
    Route::patch('/admin/master-ruangan', [MasterRuanganController::class, 'update'])->name('master_ruangan.update');
    Route::post('/admin/master-ruangan', [MasterRuanganController::class, 'store'])->name('master_ruangan.store');
    Route::delete('/admin/master-ruangan', [MasterRuanganController::class, 'destroy'])->name('master_ruangan.destroy');
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



    //route master sistem operasi
    route::get('/admin/master-sistem-operasi', [MasterSistemOperasiController::class, 'index'])->name('admin.master.sistem_operasi.index');
    Route::patch('/admin/master-sistem-operasi', [MasterSistemOperasiController::class, 'update'])->name('admin.master.sistem_operasi.update');
    Route::post('/admin/master-sistem-operasi', [MasterSistemOperasiController::class, 'store'])->name('admin.master.sistem_operasi.store');
    Route::delete('/admin/master-sistem-operasi', [MasterSistemOperasiController::class, 'destroy'])->name('admin.master.sistem_operasi.destroy');
    // route api for arsitektur sistem operasi
    route::get('api/master/sistem_operasi/arsitektur', function () {
        $arsitektur_list = MasterSistemOperasi::select('arsitektur')->groupBy('arsitektur')->get();
        return response()->json([$arsitektur_list]);
    })->name('admin.master.sistem_operasi.arsitektur');


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

    // route api for jabatan
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


    route::get('/dashboard', function () {
        Log::info('Showing the user profile for user');

        $kondisi = DB::table('barang')
            ->select('kondisi', DB::raw('count(*) as jumlah'))
            ->groupBy('kondisi')
            ->orderBy('kondisi', "asc")
            ->get();

        $kondisi_total = $kondisi->sum('jumlah');

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
        return Inertia::render('Dashboard', ['kondisi' => $kondisi, 'kondisi_total' => $kondisi_total, 'ruangan_summary' => $ruangan_summary, 'jenis_summary' => $jenis_summary]);
    })->name('dashboard');


    route::get('/', function () {
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
    Route::post('/maintenance/check', [MaintenanceController::class, 'check'])->name('maintenance.check');

    route::get('/admin/kelola-pengajuan', [MaintenanceController::class, 'admin'])->name('admin.kelola.pengajuan');
    route::get('/admin/pengajuan', [MaintenanceController::class, 'pengajuan_fetch'])->name('admin.pengajuan.fetch');
    route::post('/admin/pengajuan', [MaintenanceController::class, 'pengajuan_approve'])->name('admin.pengajuan.approve');

    Route::get('/editable', function () {
        return Inertia::render('Editable');

    });

});

require __DIR__ . '/auth.php';
