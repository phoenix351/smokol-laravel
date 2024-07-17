<?php

namespace App\Http\Controllers;

use Barryvdh\DomPDF\Facade\Pdf;

use Illuminate\Http\Request;
use Inertia\Inertia;


use App\Models\MasterBarang;
use App\Models\MasterRuangan;
use App\Models\Ruangan;

class LaporanController extends Controller
{
    protected $jenis_kode  = [
        "PC Workstation" => "3100101007",
        "P.C Unit" => "3100102001",
        "Lap Top" => "3100102002",
        "Note Book" => "3100102003",
        "Printer" => "3100203003",
        "Scanner" => "3100203004",
    ];
    private function get_dbr($id_ruangan = 0)
    {
        $jenis_kode = [
            "PC Workstation" => "3100101007",
            "P.C Unit" => "3100102001",
            "Lap Top" => "3100102002",
            "Note Book" => "3100102003",
            "Printer" => "3100203003",
            "Scanner" => "3100203004",
        ];
        $ruangan = Ruangan::where('master_ruangan.id', $id_ruangan)
            ->leftJoin('users', 'users.id', 'master_ruangan.users_id')
            ->select('master_ruangan.*', 'users.nama_lengkap', 'users.nip')->first();

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
                'users.nip',
                'master_ruangan.nama as ruangan_nama'
            )
            ->where('master_ruangan.id', $id_ruangan)
            ->orderBy('nomor_urut_pendaftaran', 'asc')
            ->get();
        $data->transform(function ($item, $key) {
            $item['kode_barang'] = $this->jenis_kode[$item['jenis']];
            return $item;
        });

        return ['dbr' => $data->toArray(), 'ruangan' => $ruangan];
    }
    public function dbr()
    {
        $dbr = $this->get_dbr();
        $daftar_ruangan = Ruangan::select('id', 'nama')->get();
        return Inertia::render('Admin/Laporan/Dbr', ['daftar_ruangan' => $daftar_ruangan]);
    }
    public function cetak_dbr($id_ruangan)
    {
        $dbr = $this->get_dbr($id_ruangan);


        $nama_kepala = "Asim Saputra, S.ST, M.Ec.Dev";
        $nip_kepala = "19760927 199901 1 001";


        $pdf = Pdf::loadView('laporan.cetak', ['data' => $dbr['dbr'], 'jenis_kode' => $this->jenis_kode, 'nama_kepala' => $nama_kepala, 'nip_kepala' => $nip_kepala, 'ruangan' => $dbr['ruangan']]);
        return $pdf->stream();
    }
    public function fetch_dbr($id_ruangan)
    {
        $dbr = $this->get_dbr($id_ruangan);
        return response()->json($dbr, 200);
    }
}
