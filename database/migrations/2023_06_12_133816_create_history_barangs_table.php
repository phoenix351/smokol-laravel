<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('history_barang', function (Blueprint $table) {
            $table->id();
            $table->integer('id_barang');
            $table->integer('id_sistem_operasi');
            $table->date('tanggal_peroleh')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->date('tanggal_kembali')->nullable();
            $table->integer('id_ruangan');
            $table->string('kondisi', 12);
            $table->string('status_pemeliharaan', 20)->default('Operasional');
            $table->string('bast_path', 255)->nullable();
            $table->string('bast_status', 1)->default('1');
            $table->dateTime('tanggal_perubahan')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->integer('id_pengguna');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('history_barang');
    }
};
