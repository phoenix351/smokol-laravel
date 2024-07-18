<?php

namespace App\Http\Controllers;

use App\Http\Requests\StorePerusahaanRequest;
use App\Http\Requests\UpdatePerusahaanRequest;
use App\Models\Penanggungjawab;
use App\Models\Perusahaan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;

class PerusahaanController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Inertia::render('Admin/Master/Perusahaan/index', ['master_perusahaan' => Perusahaan::all(), 'master_pj' => Penanggungjawab::all()]);
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
    public function store(StorePerusahaanRequest $request)
    {
        $validatedRequest = $request->validate($request->rules());

        try {
            //code...
            DB::beginTransaction();

            Perusahaan::create($validatedRequest);
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
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
    public function update(UpdatePerusahaanRequest $request)
    {
        $validatedRequest = $request->validate($request->rules());

        try {
            //code...
            DB::beginTransaction();

            $perusahaan = Perusahaan::find($validatedRequest['id']);
            $perusahaan->nama = $validatedRequest['nama'];
            $perusahaan->alamat = $validatedRequest['alamat'];
            $perusahaan->npwp = $validatedRequest['npwp'];
            $perusahaan->bank = $validatedRequest['bank'];
            $perusahaan->nomor_rekening = $validatedRequest['nomor_rekening'];
            $perusahaan->save();
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {

        try {
            //code...
            DB::beginTransaction();

            $perusahaan = Perusahaan::find($id);

            $perusahaan->delete();
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }
    public function fetch(Request $request)
    {
        $perusahaan_id = $request->input('perusahaan_id');

        if (strlen($perusahaan_id) > 0) {
            $data = Perusahaan::where('master_perusahaan.id', $perusahaan_id)
                ->join('master_pj_perusahaan', 'master_pj_perusahaan.id', 'master_perusahaan.id')
                ->select('master_perusahaan.*', 'master_pj_perusahaan.nama as nama_pj', 'master_pj_perusahaan.jabatan as jabatan_pj')
                ->first();
        } else {
            $data = Perusahaan::get();
        }
        return response()->json([
            'data' => $data
        ]);
    }
}
