<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Perusahaan extends Model
{
    use HasFactory;
    protected $table = 'master_perusahaan';
    public $timestamps = false;
    protected $fillable = ['nama', 'alamat', 'npwp', 'bank', 'nomor_rekening'];
    public function Penanggungjawab(): HasOne
    {
        return $this->hasOne(Penanggungjawab::class);
    }
}
