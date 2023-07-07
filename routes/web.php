<?php

use App\Http\Controllers\MasterBarangController;
use App\Http\Controllers\MasterJabatanController;
use App\Http\Controllers\MasterRuanganController;
use App\Http\Controllers\MasterSistemOperasiController;
use App\Http\Controllers\HistoryBarangController;
use App\Http\Controllers\HistoryBarangUserController;
use App\Http\Controllers\ProfileController;
use App\Models\HistoryBarang;
use App\Models\MasterBarang;
use App\Models\MasterJabatan;
use App\Models\MasterRuangan;
use App\Models\MasterSistemOperasi;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
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

    //route master kelola barang
    route::get('/admin/history-barang', [HistoryBarangController::class, 'index'])->name('admin.kelola.history_barang.index');
    Route::patch('/admin/history-barang', [HistoryBarangController::class, 'update'])->name('admin.kelola.history_barang.update');
    Route::post('/admin/history-barang', [HistoryBarangController::class, 'store'])->name('admin.kelola.history_barang.store');
    Route::delete('/admin/history-barang', [HistoryBarangController::class, 'destroy'])->name('admin.kelola.history_barang.destroy');



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


    // route api for master barang
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


    route::get('/', function () {
        return Inertia::render('Dashboard');
    })->name('root');

    route::get('/dashboard', function () {
        return Inertia::render('Dashboard');
    })->name('dashboard');
    route::get('/statistics', function () {
        return Inertia::render('Statistics');
    })->name('statistics');

    route::get('/pengajuan', function () {
        return Inertia::render('Pengajuan');
    })->name('pengajuan');
    // route::get('/admin/kelola-barang', function () {
    //     return Inertia::render('Admin/KelolaBarang');
    // })->name('admin.kelola.barang');
    route::get('/admin/kelola-pengajuan', function () {
        return Inertia::render('Admin/KelolaPengajuan');
    })->name('admin.kelola.pengajuan');

    //route barang untuk user
    route::get('/barang', [HistoryBarangUserController::class, 'index'])->name('barang');
    Route::patch('/barang', [HistoryBarangUserController::class, 'update'])->name('barang.update');
    Route::post('/barang', [HistoryBarangUserController::class, 'store'])->name('barang.store');
    Route::delete('/barang', [HistoryBarangUserController::class, 'destroy'])->name('barang.destroy');
});

require __DIR__ . '/auth.php';
