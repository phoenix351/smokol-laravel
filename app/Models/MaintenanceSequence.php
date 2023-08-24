<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MaintenanceSequence extends Model
{
    use HasFactory;

    protected $table = 'maintenance_sequences';
    protected $fillable = ['barang_id', 'users_id', 'keluhan', 'kondisi_final', 'catatan_admin', 'bukti_rusak_berat', 'biaya', 'created_at', 'updated_at', 'updated_at'];
}