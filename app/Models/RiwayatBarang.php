<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RiwayatBarang extends Model
{
    use HasFactory;
    protected $table = 'riwayat_barang';
    protected $fillable = ['barang_id', 'waktu_perubahan', 'users_id', 'atribut', 'nilai_lama', 'nilai_baru'];

    public function barang()
    {
        return $this->belongsTo(Barang::class);
    }
}
