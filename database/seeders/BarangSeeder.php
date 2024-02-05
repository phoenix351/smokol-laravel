<?php

namespace Database\Seeders;

use App\Models\Barang;
use App\Models\MasterBarang;
use Illuminate\Database\Seeder;


class BarangSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $master_barang = MasterBarang::all();
        $data = [];
        foreach ($master_barang as $barang) {
            $data[] = [
                'barang_id' => $barang['id'],
                'users_id' => '5',
                'sistem_operasi_id' => '5',
                'ruangan_id' => '5',
            ];
        }

        Barang::insert($data);
    }
}
