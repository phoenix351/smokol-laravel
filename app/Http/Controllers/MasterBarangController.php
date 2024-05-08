<?php

namespace App\Http\Controllers;

use App\Models\MasterBarang;
use App\Http\Requests\StoreMasterBarangRequest;
use App\Http\Requests\UpdateMasterBarangRequest;
use App\Models\Barang;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Database\QueryException;

use Illuminate\Http\Request;

use Illuminate\Validation\ValidationException;

use Inertia\Inertia;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class MasterBarangController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {

        return Inertia::render('Admin/Master/Barang', ['master_barang' => MasterBarang::all()]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreMasterBarangRequest $request)
    {

        try {
            $validatedData = $request->validate($request->rules());
            $validatedData['tanggal_peroleh'] = Carbon::parse($validatedData['tanggal_peroleh'])->format('Y-m-d H:i:s');
            $response = [
                'message' => 'Data berhasil ditambahkan',
            ];
            DB::beginTransaction();
            $master_barang = MasterBarang::create($validatedData);
            $data = [
                'barang_id' => $master_barang->id,
                'sistem_operasi_id' => 5,
                'users_id' => 5,
                'ruangan_id' => 5,
            ];
            Barang::create($data);
            DB::commit();
            $statusCode = 201;
        } catch (QueryException $e) {
            DB::rollBack();
            $response = [
                'message' => 'Koneksi gagal',
                'errors' => $e->getMessage(),
            ];
        } catch (ValidationException $e) {
            DB::rollBack();
            $response = [
                'message' => 'Validation error',
                'errors' => $e->getMessage(),
            ];
            $statusCode = 422;
        } catch (\Exception $e) {
            DB::rollBack();
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $statusCode = 500;
        }

        return response()->json($response, $statusCode);
    }

    /**
     * Display the specified resource.
     */
    public function show(MasterBarang $masterBarang)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(MasterBarang $masterBarang)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateMasterBarangRequest $request)
    {


        try {
            $validatedData = $request->validate($request->rules());
            $validatedData['tanggal_peroleh'] = Carbon::parse($validatedData['tanggal_peroleh'])->format('Y-m-d H:i:s');

            $updateRecord = MasterBarang::findOrFail($request->id);

            $updateRecord->update($validatedData);

            $response = [
                'message' => 'Berhasil melakukan update data',
                'data' => $updateRecord
            ];

            $statusCode = 200;
        } catch (QueryException $e) {
            $response = [
                'message' => 'Gagal melakukan update data: QueryException',
                'error' => $e->getMessage()
            ];
            $statusCode = 500; // Internal Server Error
        } catch (ModelNotFoundException $e) {
            $response = [
                'message' => 'Gagal melakukan update data: ModelNotFoundException',
                'error' => $e->getMessage()
            ];
            $statusCode = 404; // Not Found
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Gagal melakukan update data: ValidationException',
                'error' => $e->getMessage()
            ];
            $statusCode = 422; // Unprocessable Entity
        } catch (\Illuminate\Database\Eloquent\MassAssignmentException $e) {
            $response = [
                'message' => 'Gagal melakukan update data: MassAssignmentException',
                'error' => $e->getMessage()
            ];
            $statusCode = 500; // Internal Server Error
        } catch (\Exception $e) {
            $response = [
                'message' => 'Gagal melakukan update data: Exception',
                'error' => $e->getMessage()
            ];
            $statusCode = 500; // Internal Server Error
        }

        return response()->json($response, $statusCode);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request)
    {
        try {

            $updateRecord = MasterBarang::findOrFail($request->query('id'));

            $updateRecord->delete();

            $response = [
                'message' => 'Berhasil menghapus data',
                'req' => $request->query('id')
            ];

            $master_barang = MasterBarang::all();
        } catch (QueryException $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
        } catch (ModelNotFoundException $e) {
            $response = [
                'errors' => 'Record not founsadsadd' . $request->query('id'),
            ];
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ];
        } catch (\Exception $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
        }
        return Inertia::render('Admin/MasterBarang', [
            'response' => $response,
            'master_barang' => $master_barang
        ]);
    }
}