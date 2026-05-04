<?php

namespace App\Http\Controllers;

use App\Http\Requests\StorePenanggungjawabRequest;
use App\Http\Requests\UpdatePenanggungjawabRequest;
use App\Models\MasterPenanggungJawab;
use App\Models\Penanggungjawab;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PenanggungJawabController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
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
    public function store(StorePenanggungjawabRequest $request)
    {
        $validatedRequest = $request->validate($request->rules());

        try {
            //code...
            DB::beginTransaction();

            Penanggungjawab::create($validatedRequest);
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
    public function update(UpdatePenanggungjawabRequest $request)
    {
        $validatedRequest = $request->validate($request->rules());

        try {
            //code...
            DB::beginTransaction();

            $penanggungjawab = PenanggungJawab::find($validatedRequest['id']);
            $penanggungjawab->nama = $validatedRequest['nama'];
            $penanggungjawab->jabatan = $validatedRequest['jabatan'];
            $penanggungjawab->email = $validatedRequest['email'];
            $penanggungjawab->nomor_wa = $validatedRequest['nomor_wa'];
            $penanggungjawab->perusahaan_id = $validatedRequest['perusahaan_id'];
            $penanggungjawab->save();
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

            $penanggungjawab = PenanggungJawab::find($id);

            $penanggungjawab->delete();
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }
    public function fetch(Request $request)
    {
        $perusahaan_id = $request->input('id');

        if ($perusahaan_id > 0) {
            $data = PenanggungJawab::where('perusahaan_id', $perusahaan_id)
                ->get();
        } else if ($perusahaan_id == 0) {
            $data = PenanggungJawab::all();
        }
        return response()->json([
            'data' => $data
        ]);
    }
}
