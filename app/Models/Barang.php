<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Barang extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = "barang";
    protected $fillable = ["id", "barang_id", "pengguna_id", "ruangan_id"];
}
