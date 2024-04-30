<?php

namespace App\Http\Controllers;

use Barryvdh\DomPDF\Facade\Pdf;

use Illuminate\Http\Request;


use App\Models\MasterBarang;

class LaporanController extends Controller
{
    public function cetak(Request $request)
    {
        $jenis_kode = [
            "PC Workstation" => "3100101007",
            "P.C Unit" => "3100102001",
            "Lap Top" => "3100102002",
            "Note Book" => "3100102003",
            "Printer" => "3100203003",
            "Scanner" => "3100203004",
        ];
        $data = MasterBarang::join('barang', 'barang.barang_id', 'master_barang.id')
            ->leftJoin('users', 'users.id', 'barang.users_id')
            ->leftJoin('master_ruangan', 'master_ruangan.id', 'barang.ruangan_id')
            ->select(
                'barang.id',
                'barang.users_id',
                'barang.ruangan_id',
                'barang.kondisi',
                'barang.sistem_operasi_id',
                'master_barang.jenis',
                'master_barang.merk',
                'master_barang.tipe',
                'master_barang.nomor_seri',
                'master_barang.nomor_urut_pendaftaran',
                'master_barang.tanggal_peroleh',
                'users.nama_lengkap',
                'master_ruangan.nama as ruangan_nama'
            )
            ->get()->toArray();
        $nama_kepala = "Asim Saputra, S.ST, M.Ec.Dev";
        $nip_kepala = "19760927 199901 1 001";
        $nama_pj = "Sarjani Harini Martiningsih, S.Si";
        $nip_pj = "19880306 201101 2 015";
        $pdf = Pdf::loadView('laporan.cetak', ['data' => $data, 'jenis_kode' => $jenis_kode, 'nama_kepala' => $nama_kepala, 'nip_kepala' => $nip_kepala, 'nama_pj' => $nama_pj, 'nip_pj' => $nip_pj]);
        return $pdf->stream();
    }
}
