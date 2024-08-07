<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use Barryvdh\DomPDF\Facade\Pdf;

use Illuminate\Http\Request;
use Inertia\Inertia;


use App\Models\MasterBarang;
use App\Models\MasterRuangan;
use App\Models\Ruangan;
use App\Models\User;

class LaporanController extends Controller
{
    
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
            $item['kode_barang'] = $this->generate_code($item['jenis']);
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

        $kepala = User::whereRelation('Jabatan', 'nama', 'like', '%kepala%')->first();
        $nama_kepala = $kepala->nama_lengkap;
        $nip_kepala = $kepala->nip;


        $pdf = Pdf::loadView('laporan.cetak', ['data' => $dbr['dbr'],  'nama_kepala' => $nama_kepala, 'nip_kepala' => $nip_kepala, 'ruangan' => $dbr['ruangan']]);
        return $pdf->stream();
    }
    public function fetch_dbr($id_ruangan)
    {
        $dbr = $this->get_dbr($id_ruangan);
        return response()->json($dbr, 200);
    }

}
