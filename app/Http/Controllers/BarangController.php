<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Http\Requests\StoreBarangRequest;
use App\Http\Requests\UpdateBarangRequest;

use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Validation\ValidationException;
use Illuminate\Database\QueryException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\DB;


class BarangController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Inertia::render('Admin/KelolaBarang', ['history_barang' => DB::table('barang_view')->get()]);
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
    public function store(StoreBarangRequest $request)
    {
        try {
            $validatedData = $request->validate($request->rules());
            // $validatedData['tahun_peroleh'] = Carbon::parse($validatedData['tahun_peroleh'])->format('Y-m-d H:i:s');
            $response = [
                'message' => 'Data berhasil ditambahkan',
            ];

            Barang::create($validatedData);
            $history_barang = Barang::all();
        } catch (QueryException $e) {
            $response = [
                'message' => 'Koneksi gagal',
                'data_sent' => $validatedData,
                'errors' => $e->getMessage(),
            ];
            $history_barang = [];
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ];
            $history_barang = [];
        } catch (\Exception $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $history_barang = [];
        }

        return Inertia::render('Admin/Barang', [
            'response' => $response,
            'history_barang' => $history_barang
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Barang $Barang)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Barang $Barang)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateBarangRequest $request, Barang $Barang)
    {

        try {
            $validatedData = $request->validate($request->rules());
            // $validatedData['tahun_peroleh'] = Carbon::parse($validatedData['tahun_peroleh'])->format('Y-m-d H:i:s');

            $updateRecord = Barang::findOrFail($request->id);

            $updateRecord->update($validatedData);

            $response = [
                'message' => 'Berhasil melakukan update data'
            ];

            $history_barang = Barang::all();
        } catch (QueryException $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $history_barang = [];
        } catch (ModelNotFoundException $e) {
            $response = [
                'errors' => 'Record not found',
            ];
            $history_barang = [];
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ];
            $history_barang = [];
        } catch (\Exception $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $history_barang = [];
        }

        return Inertia::render('Admin/Barang', [
            'response' => $response,
            'history_barang' => $history_barang
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request)
    {
        try {

            $updateRecord = Barang::findOrFail($request->query('id'));

            $updateRecord->delete();

            $response = [
                'message' => 'Berhasil menghapus data',
                'req' => $request->query('id')
            ];

            $history_barang = Barang::all();
        } catch (QueryException $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $history_barang = [];
        } catch (ModelNotFoundException $e) {
            $response = [
                'errors' => 'Record not founsadsadd' . $request->query('id'),
            ];
            $history_barang = [];
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ];
            $history_barang = [];
        } catch (\Exception $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $history_barang = [];
        }
        return Inertia::render('Admin/Barang', [
            'response' => $response,
            'history_barang' => $history_barang
        ]);
    }
}
