<?php

namespace App\Http\Controllers;

use App\Models\Maintenance;
use App\Models\MaintenanceSequence;
use App\Http\Requests\StoreMaintenanceRequest;
use App\Http\Requests\UpdateMaintenanceRequest;

use Inertia\Inertia;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;

use Illuminate\Support\Facades\DB;

class MaintenanceController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = auth()->user();

        // return Inertia::render('Barang', ['history_barang' => DB::table('barang_view')->where('pengguna_id', $user->id)->get()]);

        $maintenance_list = MaintenanceSequence::select('maintenance_sequences.*', 'maintenances.id as maintenance_id', 'maintenances.status', 'master_barang.jenis', 'master_barang.merk', "master_barang.tipe", 'master_barang.nomor_seri')
            ->join('maintenances', 'maintenances.sequence_id', '=', 'maintenance_sequences.id')
            ->join('master_barang', 'maintenance_sequences.barang_id', '=', 'master_barang.id')
            ->where('maintenance_sequences.users_id', $user->id)
            ->get();
        // $maintenance_list = DB::table('maintenances')->where('users_id', $user->id);
        return Inertia::render('Maintenance', ['maintenance_list' => $maintenance_list]);
    }

    public function admin()
    {

        $user = auth()->user();

        if ($user->role != 'admin') {
            return 0;
        }


        // return Inertia::render('Barang', ['history_barang' => DB::table('barang_view')->where('pengguna_id', $user->id)->get()]);

        $maintenance_list = MaintenanceSequence::select('maintenance_sequences.*', 'maintenances.id as maintenance_id', 'maintenances.status')
            ->join('maintenances', 'maintenances.sequence_id', '=', 'maintenance_sequences.id')
            ->get();
        // $maintenance_list = DB::table('maintenances')->where('users_id', $user->id);
        return Inertia::render('Admin/KelolaPengajuan', ['maintenance_list' => $maintenance_list]);
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
    public function store(StoreMaintenanceRequest $request)
    {
        try {
            $validatedData = $request->validate($request->rules());
            // Log::info($validatedData['keluhan']);
            $response = [
                'message' => 'Data berhasil ditambahkan',
                'data' => $validatedData, 'errors' => '',
            ];
            // cek apakah sudah ada sequence yang masih aktif

            // insert
            $newSequences = MaintenanceSequence::create($validatedData);
            $newMaintenance = Maintenance::create(['sequence_id' => $newSequences->id, 'status' => 'Pending']);

            $history_barang = Maintenance::all();
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

        return Inertia::render('Barang', [
            'response' => $response,
            'history_barang' => $history_barang
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Maintenance $maintenance)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Maintenance $maintenance)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateMaintenanceRequest $request, Maintenance $maintenance)
    {

        $validatedRequest = $request->validate($request->rules());
        // return response()->json($validatedRequest);

        $updatedSequence = MaintenanceSequence::where('id', $validatedRequest['sequence_id'])->update(['keluhan' => $validatedRequest['keluhan']]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Maintenance $maintenance)
    {
        //
    }
    public function check(Request $request)
    {
        $barang_id = $request->post('barang_id');
        $maintenance = DB::table('maintenances')
            ->join('maintenance_sequences', 'maintenances.sequence_id', '=', 'maintenance_sequences.id')
            ->where('maintenance_sequences.barang_id', $barang_id)
            ->get();

        return response()->json($maintenance);
    }
}
