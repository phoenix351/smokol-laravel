<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Date;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        //
        Schema::table('barang', function (Blueprint $table) {
            $table->date('bast_upload_date')->nullable();
            $table->renameColumn('pengguna_id', 'users_id');
            $table->renameColumn('tanggal_peroleh', 'record_time');
            $table->dropColumn('tanggal_kembali');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('barang', function (Blueprint $table) {
            $table->dropColumn('bast_upload_date');
        });
        //
    }
};
