<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class BastModel extends Model
{
    use HasFactory;
    protected $table = 'bast';
    protected $fillable = ['uploaded_date', 'is_approved', 'approval_date', 'path', 'comment'];
    public $timestamps = false;

    public function Barang(): HasMany
    {
        return $this->hasMany(Barang::class);
    }
}
