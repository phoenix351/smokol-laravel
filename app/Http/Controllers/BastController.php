<?php

namespace App\Http\Controllers;

use App\Models\BastModel;
use App\Http\Requests\StoreBastModelRequest;
use App\Http\Requests\UpdateBastModelRequest;
use App\Models\Barang;
use App\Models\User;
use Barryvdh\DomPDF\Facade\Pdf as FacadePdf;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Storage;

use PDF;

class BastController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
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
    public function store(StoreBastModelRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(BastModel $bastModel)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(BastModel $bastModel)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateBastModelRequest $request, BastModel $bastModel)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(BastModel $bastModel)
    {
        //
    }

    public function get_bast_by_barangId(Request $request)
    {
        $id = $request->get('barang_id');
        $bastList = BastModel::where('barang_id', $id)->get();

        return response()->json([$bastList]);
    }

    public function upload(Request $request)
    {
        try {
            //check is already have docs
            $barang_id = $request->post('barang_id');
            $current_path = Barang::where('id', $barang_id)->value('bast_path');
            // dd($barang_id);
            if ($current_path && Storage::exists($current_path)) {
                // Delete the file
                Storage::delete($current_path);
                $message = 'File deleted successfully.';
            }

            // return response()->json($current_path, 200);
            $path = $request->file('file')->store('public/files/bast');
            Barang::where('id', $barang_id)->update(
                ['bast_path' => $path]
            );
            dd($path);

            return response()->json(
                ['message' => 'Berhasil mengunggah dokumen BAST'],
                201
            );
        } catch (\Throwable $th) {
            throw $th;
        }
    }
    public function show_file(Request $request)
    {
        $filePath =  $request->get('filepath');

        if (Storage::exists($filePath)) {
            $fileContents = Storage::get($filePath);

            // Specify the Content-Type header as application/pdf
            $headers = [
                'Content-Type' => 'application/pdf',
            ];

            // Use Symfony's Response class to return the file contents with headers
            return new Response($fileContents, 200, $headers);
        } else {
            // Return a response with 404 status if the file is not found
            return response()->json([$filePath]);
        }
    }
    public function cetak(Request $request)
    {
        $pihak1_user_id = $request->get('pihak1_user_id');
        $pihak2_user_id = $request->get('pihak2_user_id');
        $daftar_id_barang = explode(",", $request->get('barangs'));
        $barangs = Barang::with(['User', 'Barang'])->whereIn('id', $daftar_id_barang)->get();
        // dd($barangs);
        $pihak1 = User::find($pihak1_user_id);
        $pihak2 = User::find($pihak2_user_id);

        $pdf = FacadePdf::loadView('laporan.bast', ['barangs' => $barangs, 'pihak1' => $pihak1, 'pihak2' => $pihak2]);
        // return view('laporan.bast', ['barangs' => $barangs, 'pihak1' => $pihak1, 'pihak2' => $pihak2]);
        return $pdf->stream('bast.pdf');
    }
}
