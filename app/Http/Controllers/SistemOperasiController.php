<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreMasterSistemOperasiRequest;
use App\Models\SistemOperasi;
use App\Http\Requests\StoreSistemOperasiRequest;
use App\Http\Requests\UpdateSistemOperasiRequest;

use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Validation\ValidationException;
use Illuminate\Database\QueryException;
use Illuminate\Database\Eloquent\ModelNotFoundException;


class SistemOperasiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Inertia::render('Admin//SistemOperasi', ['_sistem_operasi' => SistemOperasi::all()]);
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
    public function store(StoreSistemOperasiRequest $request)
    {
        try {
            $validatedData = $request->validate($request->rules());

            $response = [
                'message' => 'Data berhasil ditambahkan',
            ];

            SistemOperasi::create($validatedData);
            $_sistem_operasi = SistemOperasi::all();
        } catch (QueryException $e) {
            $response = [
                'message' => 'Koneksi gagal',
                'data_sent' => $validatedData,
                'errors' => $e->getMessage(),
            ];
            $_sistem_operasi = [];
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ];
            $_sistem_operasi = [];
        } catch (\Exception $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $_sistem_operasi = [];
        }

        return Inertia::render('Admin/SistemOperasi', [
            'response' => $response,
            '_sistem_operasi' => $_sistem_operasi
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(SistemOperasi $SistemOperasi)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(SistemOperasi $SistemOperasi)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateSistemOperasiRequest $request, SistemOperasi $SistemOperasi)
    {
        try {
            $validatedData = $request->validate($request->rules());
            $updateRecord = SistemOperasi::findOrFail($request->id);

            $updateRecord->update($validatedData);

            $response = [
                'message' => 'Berhasil melakukan update data'
            ];

            $_sistem_operasi = SistemOperasi::all();
        } catch (QueryException $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $_sistem_operasi = [];
        } catch (ModelNotFoundException $e) {
            $response = [
                'errors' => 'Record not found',
            ];
            $_sistem_operasi = [];
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ];
            $_sistem_operasi = [];
        } catch (\Exception $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $_sistem_operasi = [];
        }

        return Inertia::render('Admin/SistemOperasi', [
            'response' => $response,
            '_sistem_operasi' => $_sistem_operasi
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request)
    {
        try {

            $deleted_record = SistemOperasi::findOrFail($request->query('id'));

            $deleted_record->delete();

            $response = [
                'message' => 'Berhasil menghapus data',
                'req' => $request->query('id')
            ];

            $_sistem_operasi = SistemOperasi::all();
        } catch (QueryException $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $_sistem_operasi = [];
        } catch (ModelNotFoundException $e) {
            $response = [
                'errors' => 'Record not founsadsadd' . $request->query('id'),
            ];
            $_sistem_operasi = [];
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ];
            $_sistem_operasi = [];
        } catch (\Exception $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $_sistem_operasi = [];
        }
        return Inertia::render('Admin/SistemOperasi', [
            'response' => $response,
            '_sistem_operasi' => $_sistem_operasi
        ]);
    }
}