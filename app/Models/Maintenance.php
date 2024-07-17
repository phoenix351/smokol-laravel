<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Maintenance extends Model
{
    use HasFactory;
    protected $table = 'maintenances';
    protected $fillable = [
        'kode_status', 'users_id', 'sequence_id', 'status',
        'created_at', 'updated_at'
    ];

    public function Sequence(): BelongsTo
    {
        return $this->belongsTo(MaintenanceSequence::class);
    }
    public function Status(): BelongsTo
    {
        return $this->belongsTo(StatusPemeliharaan::class,'kode_status','kode_status');
    }
}
