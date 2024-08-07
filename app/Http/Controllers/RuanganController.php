<?php

namespace App\Http\Controllers;

use App\Models\MasterRuangan;
use App\Http\Requests\StoreMasterRuanganRequest;
use App\Http\Requests\StoreRuanganRequest;
use App\Http\Requests\UpdateMasterRuanganRequest;
use App\Models\Ruangan;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Validation\ValidationException;
use Illuminate\Database\QueryException;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class RuanganController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $master_ruangan = Ruangan::join('users', 'users.id', 'master_ruangan.users_id')
            ->select('master_ruangan.*', 'users.nama_lengkap as users_nama', 'users.id as users_id')->get();
        return Inertia::render('Admin/Master/Ruangan', ['master_ruangan' => $master_ruangan]);
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
    public function store(StoreRuanganRequest $request)
    {
        try {
            $validatedData = $request->validate($request->rules());

            $response = [
                'message' => 'Data berhasil ditambahkan',
            ];

            Ruangan::create($validatedData);
            $master_ruangan = Ruangan::all();
        } catch (QueryException $e) {
            $response = [
                'message' => 'Koneksi gagal',
                'data_sent' => $validatedData,
                'errors' => $e->getMessage(),
            ];
            $master_ruangan = [];
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ];
            $master_ruangan = [];
        } catch (\Exception $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $master_ruangan = [];
        }

        return Inertia::render('Admin/MasterRuangan', [
            'response' => $response,
            'master_ruangan' => $master_ruangan
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Ruangan $masterRuangan)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Ruangan $masterRuangan)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateMasterRuanganRequest $request, Ruangan $masterRuangan)
    {
        try {
            $validatedData = $request->validate($request->rules());

            $updateRecord = Ruangan::findOrFail($request->id);

            $updateRecord->update(
                [
                    'nama' => $validatedData['nama'],
                    'users_id' => $validatedData['users_id'],
                    'kode_siman' => $validatedData['kode_siman'],
                    'kode_baru' => $validatedData['kode_baru'],
                    'gedung' => isset($validatedData['gedung']) ? $validatedData['gedung'] : '',
                    'lantai' => isset($validatedData['lantai']) ? $validatedData['lantai'] : '',
                    // 'lantai' => $validatedData['lantai'],
                    // 'id'=>$validatedData['id'],
                ]
            );

            $response = [
                'message' => 'Berhasil melakukan update data'
            ];


            $master_ruangan = Ruangan::join('users', 'users.id', 'master_ruangan.users_id')
                ->select('master_ruangan.id', 'master_ruangan.nama', 'users.nama_lengkap as users_nama', 'users.id as users_id')->get();
        } catch (QueryException $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $master_ruangan = [];
        } catch (ModelNotFoundException $e) {
            $response = [
                'errors' => 'Record not found',
            ];
            $master_ruangan = [];
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ];
            $master_ruangan = [];
        } catch (\Exception $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $master_ruangan = [];
        }
        return response()->json([
            'message' => 'Berhasil menyimpan perubahan',
        ], 201);
        // return Inertia::render('Admin/MasterRuangan', [
        //     'response' => $response,
        //     'master_ruangan' => $master_ruangan
        // ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request)
    {
        try {

            $deleted_record = Ruangan::findOrFail($request->query('id'));

            $deleted_record->delete();

            $response = [
                'message' => 'Berhasil menghapus data',
                'req' => $request->query('id')
            ];

            $master_ruangan = Ruangan::all();
        } catch (QueryException $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $master_ruangan = [];
        } catch (ModelNotFoundException $e) {
            $response = [
                'errors' => 'Record not founsadsadd' . $request->query('id'),
            ];
            $master_ruangan = [];
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ];
            $master_ruangan = [];
        } catch (\Exception $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $master_ruangan = [];
        }
        return Inertia::render('Admin/MasterRuangan', [
            'response' => $response,
            'master_ruangan' => $master_ruangan
        ]);
    }
}