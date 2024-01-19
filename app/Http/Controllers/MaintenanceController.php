<?php

namespace App\Http\Controllers;

use App\Models\Maintenance;
use App\Models\MaintenanceSequence;
use App\Http\Requests\StoreMaintenanceRequest;
use App\Http\Requests\UpdateMaintenanceRequest;
use Exception;
use Inertia\Inertia;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class MaintenanceController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = auth()->user();

        // return Inertia::render('Barang', ['history_barang' => DB::table('barang_view')->where('pengguna_id', $user->id)->get()]);

        $maintenance_list = MaintenanceSequence::select(
            'maintenance_sequences.*',
            'maintenances.id as maintenance_id',
            'maintenances.kode_status',
            'status_pemeliharaan.deskripsi as status',
            'master_barang.jenis',
            'master_barang.merk',
            'master_barang.tipe',
            'master_barang.nomor_seri'
        )
            ->join('maintenances', function ($join) {
                $join->on('maintenances.sequence_id', '=', 'maintenance_sequences.id')
                    ->whereRaw('maintenances.id = (
                    SELECT id FROM maintenances as sub_maintenances
                    WHERE sub_maintenances.sequence_id = maintenances.sequence_id
                    ORDER BY sub_maintenances.id DESC
                    LIMIT 1
                )');
            })
            ->join('master_barang', 'maintenance_sequences.barang_id', '=', 'master_barang.id')
            ->join('status_pemeliharaan', 'status_pemeliharaan.kode_status', '=', 'maintenances.kode_status')
            ->where('maintenance_sequences.users_id', $user->id)
            ->get();
        // $maintenance_list = DB::table('maintenances')->where('users_id', $user->id);
        return Inertia::render('Maintenance', ['maintenance_list' => $maintenance_list]);
    }

    public function admin()
    {

        $user = auth()->user();

        if ($user->role != 'Tim IPDS' && $user->role != 'Tim BMN') {
            return 0;
        }


        // return Inertia::render('Barang', ['history_barang' => DB::table('barang_view')->where('pengguna_id', $user->id)->get()]);

        $maintenance_list = MaintenanceSequence::select('maintenance_sequences.*', 'maintenances.id as maintenance_id',  'status_pemeliharaan.deskripsi as status', 'master_barang.jenis', 'master_barang.merk', "master_barang.tipe", 'master_barang.nomor_seri')
            ->join('maintenances', 'maintenances.sequence_id', '=', 'maintenance_sequences.id')
            ->join('status_pemeliharaan', 'maintenances.kode_status', 'status_pemeliharaan.kode_status')
            ->join('master_barang', 'maintenance_sequences.barang_id', '=', 'master_barang.id')

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

            // upload file 
            // Store the uploaded file in the storage/app/public directory
            if ($request->hasFile('problem_img_path')) {
                // Store the uploaded problem_img_path in the storage/app/public directory
                // $filePaths = [];

                $path = $request->file('problem_img_path')->store('public/images/problems');
                // $imageUrl = Storage::url($path);
                // return response()->json(['data'=>$path]);

                // foreach ($request->file('problem_img_path')['fileList'] as $file) {
                //     // Store each file in the storage/app/public directory
                //     $filePath = $file->store('public/images/problems');
                //     $filePaths[] = $filePath;
                // }
                // Update a variable in $validatedData with the value of $filePath
                $validatedData['problem_img_path'] = $path;
            } else {
                $validatedData['problem_img_path'] = null;
            }

            // insert
            $newSequences = MaintenanceSequence::create($validatedData);
            $newMaintenance = Maintenance::create(['sequence_id' => $newSequences->id, 'kode_status' => '0']);

            $response = [
                'message' => 'Data berhasil ditambahkan',
                'data' => $validatedData, 'errors' => '',
            ];

            $history_barang = Maintenance::all();
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
        $last_sequence = MaintenanceSequence::where('barang_id', $barang_id)->orderBy('id', 'DESC')->first();
        if ($last_sequence) {
            $last_sequence_id = $last_sequence->id;
            $maintenance = Maintenance::where('sequence_id', $last_sequence_id)->where('kode_status', '6')->get();
        } else {
            $maintenance = ['boleh'];
        }

        // $maintenance = DB::table('maintenances')
        //     ->join('maintenance_sequences', 'maintenances.sequence_id', '=', 'maintenance_sequences.id')
        //     ->where('maintenance_sequences.barang_id', $barang_id)
        //     ->where('maintenances.kode_status','6')
        //     ->get();

        return response()->json($maintenance);
    }
    public function riwayat($sequence_id)
    {

        $maintenance_list = Maintenance::join('status_pemeliharaan', 'maintenances.kode_status', 'status_pemeliharaan.kode_status')
            ->join('users', 'users.id', 'maintenances.users_id')
            ->where('sequence_id', $sequence_id)->select(
                'status_pemeliharaan.deskripsi',
                'maintenances.*',
                'users.nama_lengkap'
            )->get();
        $barang_id = DB::table('maintenance_sequences')->where('id', $sequence_id)->value('barang_id');
        $img_path = DB::table('maintenance_sequences')->where('id', $sequence_id)->value('problem_img_path');

        $detail_barang = DB::table('master_barang')->where('id', $barang_id)->select('jenis', 'merk', 'tipe', 'nomor_seri')->first();
        if (strlen($img_path) > 0) {

            $detail_barang->image_path = Storage::url($img_path);
        }
        return Inertia::render('User/Pengajuan/Riwayat', ['history_list' => $maintenance_list, 'detail_barang' => $detail_barang]);
    }
    public function pengajuan_fetch(Request $request)
    {
        $type = $request->query('type'); // Retrieve the 'type' query parameter
        // $id = $request->query('id'); // Retrieve the 'id' query parameter
        $query_search = $request->query('querySearch');
        $is_user = $request->query('isUser'); // Retrieve the 'id' query parameter
        $user = auth()->user();


        // Use $type and $id in your query logic
        // Example:

        // Query based on 'type'
        $maintenance_list = MaintenanceSequence::select(
            // Your select statements here
            'maintenance_sequences.id as sequence_id',
            'maintenance_sequences.keluhan',
            'maintenance_sequences.biaya',

            'master_barang.merk',
            'master_barang.tipe',
            'master_barang.jenis',
            'master_barang.nomor_seri',
            'master_barang.nomor_urut_pendaftaran',

            'status_pemeliharaan.deskripsi',
            'status_pemeliharaan.kode_status',

            'users.id as users_id',
            'users.nama_lengkap',
            'users.bidang',
        )
            ->join('maintenances', function ($join) {
                $join->on('maintenances.sequence_id', '=', 'maintenance_sequences.id')
                    ->whereRaw('maintenances.id = (
                    SELECT id FROM maintenances as sub_maintenances
                    WHERE sub_maintenances.sequence_id = maintenances.sequence_id
                    ORDER BY sub_maintenances.id DESC
                    LIMIT 1
                )');
            })
            ->join('status_pemeliharaan', 'status_pemeliharaan.kode_status', 'maintenances.kode_status')
            ->join('master_barang', 'master_barang.id', 'maintenance_sequences.barang_id')
            ->join('users', 'users.id', 'maintenance_sequences.users_id')
            ->when($type === '99', function ($query) {
                // If type is 99, ignore type in the SQL query
                return $query;
            }, function ($query) use ($type) {
                // Otherwise, add the type condition to the query
                return $query->where('maintenances.kode_status', $type);
            })

            ->when($is_user == '1', function ($query) use ($user) {
                // If query is not empty, add the search conditions to the query
                return $query->where('users.id', 'like', $user->id);
            })
            ->when($query_search, function ($query) use ($query_search) {
                // If query is not empty, add the search conditions to the query
                return $query->where(function ($query) use ($query_search) {
                    $query->where('users.nama_lengkap', 'like', '%' . $query_search . '%')
                        ->orWhere('master_barang.nomor_urut_pendaftaran', 'like', '%' . $query_search . '%')
                        ->orWhere('master_barang.merk', 'like', '%' . $query_search . '%')
                        ->orWhere('master_barang.tipe', 'like', '%' . $query_search . '%')
                        ->orWhere('master_barang.jenis', 'like', '%' . $query_search . '%');
                });
            })
            ->get();
        $maintenance_list->transform(function ($item, $key) use ($user) {
            $item['role'] = $user->role;
            return $item;
        });
        return response()->json([
            'data' => $maintenance_list,
        ]);
    }
    public function pengajuan_approve(Request $request)
    {
        $request_data = $request->all();
        try {
            // store maintenance with seq id, user id and kode status + 1
            $approved = [
                'sequence_id' => $request_data['sequence_id'],
                'users_id' => $request_data['users_id'],
                'kode_status' => $request_data['kode_status'] == "0" ? "1" : "2",
            ];
            Maintenance::create($approved);
            if ($approved['kode_status'] == '2') {
                $approved['kode_status'] = '3';
                Maintenance::create($approved);
            }
            return response()->json([
                'data' => $approved,
            ]);
        } catch (\Exception $e) {
            throw $e;
        }
    }
}
