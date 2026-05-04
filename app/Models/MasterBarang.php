<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class MasterBarang extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = "master_barang";
    protected $fillable = ["id", "jenis", "merk", "tipe", "tanggal_peroleh", "nomor_seri", "nomor_urut_pendaftaran"];

    public function Barang(): HasOne
    {
        return $this->hasOne(Barang::class);
    }
}
