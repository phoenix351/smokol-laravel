<?php

namespace App\Models;

// use App\Events\BarangUpdating;

use App\Events\BarangUpdating;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Barang extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $dispatchesEvents = [
        'updating' => BarangUpdating::class,
        // 'deleted' => UserDeleted::class,
    ];
    protected $table = "barang";
    protected $fillable = ["id", "barang_id", "users_id", "ruangan_id", "sistem_operasi_id", "record_time", "kondisi", "status_pemeliharaan", "bast_path", "is_approved", "bast_upload_date"];

    public function riwayat()
    {
        return $this->hasMany(RiwayatBarang::class);
    }
    public function User(): BelongsTo
    {
        return $this->belongsTo(User::class,'users_id');
    }
    public function Ruangan(): BelongsTo
    {
        return $this->belongsTo(Ruangan::class);
    }
    public function Barang(): BelongsTo
    {
        return $this->belongsTo(MasterBarang::class);
    }
    public function SistemOperasi(): BelongsTo
    {
        return $this->belongsTo(SistemOperasi::class);
    }
}
