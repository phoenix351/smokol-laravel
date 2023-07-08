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
        Schema::create('barang', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('barang_id');
            $table->foreign('barang_id')->references('id')->on('master_barang')->onDelete('cascade');

            $table->unsignedBigInteger('sistem_operasi_id');
            $table->foreign('sistem_operasi_id')->references('id')->on('master_sistem_operasi')->onDelete('cascade');

            $table->unsignedBigInteger('pengguna_id');
            $table->foreign('pengguna_id')->references('id')->on('users')->onDelete('cascade');

            $table->unsignedBigInteger('ruangan_id');
            $table->foreign('ruangan_id')->references('id')->on('master_ruangan')->onDelete('cascade');

            $table->date('tanggal_peroleh')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->date('tanggal_kembali')->nullable();

            $table->string('kondisi', 12);
            $table->string('status_pemeliharaan', 20)->default('Operasional');
            $table->string('bast_path', 255)->nullable();

            $table->binary('is_approved')->default(false);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('barang');
    }
};
