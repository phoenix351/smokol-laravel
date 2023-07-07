<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MasterBarang extends Model
{
    use HasFactory;
    protected $table = "master_barang";
    protected $fillable = ["id", "jenis", "merk", "tipe", "tahun_peroleh", "nomor_seri"];
}
