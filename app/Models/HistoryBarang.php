<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HistoryBarang extends Model
{
    use HasFactory;
    protected $table = "history_barang";
    protected $fillable = ["id", "id_barang", "id_sistem_operasi", "tanggal_terima", "tanggal_serah", "id_ruangan", "kondisi", "status_pemeliharaan", "bast_path", "bast_status", "tanggal_perubahan", "id_pengguna"];
}
