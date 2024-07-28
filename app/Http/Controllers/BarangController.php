<?php

namespace App\Http\Controllers;

use App\Events\BarangUpdating;
use App\Models\Barang;
use App\Models\MasterBarang;
use App\Http\Requests\StoreBarangRequest;
use App\Http\Requests\UpdateBarangRequest;
use Barryvdh\DomPDF\Facade\Pdf as FacadePdf;
use Barryvdh\DomPDF\PDF;
use League\Csv\Writer;
use SplTempFileObject;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Validation\ValidationException;
use Illuminate\Database\QueryException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class BarangController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {

        // $data = Barang::with(['Barang', 'Ruangan', 'SistemOperasi', 'User'])->paginate(10);
        return Inertia::render('Admin/KelolaBarang');
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
    public function update(UpdateBarangRequest $request)
    {

        try {
            $validatedData = $request->validate($request->rules());
            // $validatedData['tahun_peroleh'] = Carbon::parse($validatedData['tahun_peroleh'])->format('Y-m-d H:i:s');

            $updateRecord = Barang::findOrFail($validatedData['id']);

            $updateRecord->update($validatedData);
            $updateRecord->save();

            // BarangUpdating::dispatch($updateRecord);

            $response = [
                'message' => 'Berhasil melakukan update data',
                'data' => $updateRecord
            ];
        } catch (QueryException $e) {
            $response = [
                'message' => 'An asu occurred',
                'error' => $e->getMessage(),
            ];
            return response()->json($response, 429);
        } catch (ModelNotFoundException $e) {
            $response = [
                'error' => 'Record not found',
            ];
            return response()->json($response, 404);
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Validation error',
                'error' => $e->errors(),
            ];
            return response()->json($response, 422);
        } catch (\Exception $e) {
            $response = [
                'message' => 'Another error occurred',
                'error' => json_encode($e),
            ];
            throw $e;
            return response()->json($response, 500);
        }

        return response()->json($response, 201);
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
    public function fetch(Request $request)
    {
        // $current = $request->get('current');
        $user = auth()->user();
        $data = $this->get_barang($request);
        $pageSize = $request->get('pageSize') ?? 10;
        $search = $request->get('searchText');

        $isUser = $request->get('isUser');

        $searchText = "%$search%";

        $data = $data->paginate($pageSize);
        return response()->json([
            'data' => $data->items(),
            'searchText' => $searchText,
            'total' => $data->total(),
            'user' => $user->id,
            // 'current' => $current,
            // 'pageSize' => $pageSize,
        ]);
    }

    public function get_barang(Request $request)
    {
        $user = auth()->user();
        $pageSize = $request->get('pageSize') ?? 10;
        $search = $request->get('searchText');

        $isUser = $request->get('isUser');
        $userId = $request->get('userId') ?? $user->id;
        $searchText = "%$search%";


        $data = Barang::with(['Barang', 'Ruangan', 'SistemOperasi', 'User'])
            ->where(function ($query) use ($searchText) {
                $query->whereRelation('Barang', 'jenis', 'like', $searchText)
                    ->orWhereRelation('Barang', 'merk', 'like', $searchText)
                    ->orWhereRelation('Barang', 'nomor_urut_pendaftaran', 'like', $searchText)
                    ->orWhereRelation('Ruangan', 'nama', 'like', $searchText)
                    ->orWhereRelation('SistemOperasi', 'nama', 'like', $searchText)
                    ->orWhereRelation('User', 'nama_lengkap', 'like', $searchText)
                    ->orWhere('kondisi', 'like', $searchText);
            });

        if ($isUser == 1) {

            $data->where('users_id', '=', $userId);
        }
        return $data;
    }
    private function generate_code(string $jenis)
    {
        $jenis_kode  = [
            "PC Workstation" => "3100101007",
            "P.C Unit" => "3100102001",
            "Lap Top" => "3100102002",
            "Note Book" => "3100102003",
            "Printer" => "3100203003",
            "Scanner" => "3100203004",
        ];
        return $jenis_kode[$jenis];
    }
    public function cetak(Request $request)
    {
        $barang = $this->get_barang($request)->get();

        $barang->transform(function ($item, $key) {
            $item['kode_barang'] = $this->generate_code($item->Barang['jenis']);
            return $item;
        });
        $isExcel = $request->get('isExcel');
        if ($isExcel == 1) {
            $headers = ['No', 'Kode Barang', 'Nama Barang', 'Jenis', 'NUP', 'Tahun Peroleh', 'Nomor Seri', 'Pegawai', 'Kondisi'];
            $barangFlatten = [];
            foreach ($barang as $key => $value) {
                // $barangFlatten[] = [
                //     'No' => $key + 1,
                //     'Kode Barang' => $value['kode_barang'],
                //     'Nama Barang' => $value->barang['merk'] . ' / ' . $value->barang['tipe'],
                //     'Jenis' => $value->barang['jenis'],
                //     'NUP' => $value->barang['nomor_urut_pendaftaran'],
                //     'Tahun Peroleh' => $value->barang['tanggal_peroleh'] ?  \Carbon\Carbon::parse($value->barang['tanggal_peroleh'])->format('Y') : '',
                //     'Nomor Seri' => $value->barang['nomor_seri'],
                //     'Kondisi' => $value['kondisi'],
                // ];
                $barangFlatten[] = [
                    $key + 1,
                    $value['kode_barang'],
                    $value->barang['merk'] . ' / ' . $value->barang['tipe'],
                    $value->barang['jenis'],
                    $value->barang['nomor_urut_pendaftaran'],
                    $value->barang['tanggal_peroleh'] ?  \Carbon\Carbon::parse($value->barang['tanggal_peroleh'])->format('Y') : '',
                    $value->barang['nomor_seri'],
                    $value->user['nama_lengkap'],

                    $value['kondisi'],
                ];
            }

            $csv = Writer::createFromFileObject(new SplTempFileObject());
            $csv->insertOne($headers);
            $csv->insertAll($barangFlatten);
            $csv->output('data_barang.csv');
            return;
        }


        $pdf = FacadePdf::loadView('laporan.barang', ['data' => $barang]);
        return $pdf->stream();
    }
}
