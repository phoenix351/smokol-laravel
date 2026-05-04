<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Penanggungjawab extends Model
{
    use HasFactory;
    protected $table = 'master_pj_perusahaan';
    public $timestamps = false;
    protected $fillable = [
        'perusahaan_id',
        'nama',
        'jabatan',
        'nomor_wa',
        'email'
    ];
    
    public function Perusahaan():BelongsTo
    {
        return $this->belongsTo(Perusahaan::class);
    }

}
