<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class MaintenanceSequence extends Model
{
    use HasFactory;

    protected $table = 'maintenance_sequences';
    protected $fillable = [
        'barang_id',
        'users_id',
        'keluhan',
        'kondisi_final',
        'catatan_admin',
        'bukti_rusak_berat',
        'biaya',
        'created_at',
        'updated_at',
        'problem_img_path',
        'problems',
        'next_step',
        'solution',
        'spek_path',
        'estimasi_penyelesaian',
        'perusahaan_id',
    ];

    public function Maintenance(): HasMany
    {
        return $this->hasMany(Maintenance::class,'sequence_id','id');
    }
    public function Barang(): BelongsTo
    {
        return $this->belongsTo(Barang::class);
    }

    public function User():BelongsTo
    {
        return $this->belongsTo(User::class,'users_id');
    }
    public function Perusahaan():BelongsTo
    {
        return $this->belongsTo(Perusahaan::class,'perusahaan_id');
    }
}
