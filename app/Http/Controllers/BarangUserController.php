<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\MasterBarang;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Validation\ValidationException;
use Illuminate\Database\QueryException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class BarangUserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = auth()->user();


        $data = MasterBarang::join('barang', 'barang.barang_id', 'master_barang.id')
            ->leftJoin('users', 'users.id', 'barang.users_id')
            ->leftJoin('master_ruangan', 'master_ruangan.id', 'barang.ruangan_id')
            ->select(
                'barang.id',
                'barang.users_id',
                'barang.ruangan_id',
                'barang.kondisi',
                'barang.sistem_operasi_id',
                'barang.bast_path',
                'master_barang.jenis',
                'master_barang.merk',
                'master_barang.tipe',
                'master_barang.nomor_seri',
                'master_barang.nomor_urut_pendaftaran',
                'master_barang.tanggal_peroleh',
                'users.nama_lengkap',
                'master_ruangan.nama as ruangan_nama'
            )
            ->where('users.id', '=', $user->id)
            ->get();

        // $result is now a collection of the retrieved data
        // $history_barang = DB::table('barang_view')->where('pengguna_id', $user->id)->get();
        $data = $data->map(function ($row) {
            $row['bast_path'] = $row['bast_path'] ? str_replace('public', 'storage', Storage::url($row['bast_path'])) : NULL;
            return $row;
        });
        return Inertia::render('User/Barang/index', ['history_barang' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $barang = Barang::with(['Barang', 'User', 'Riwayat'])->find($id);
        return Inertia::render('User/Barang/Detail', ['barang' => $barang]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
