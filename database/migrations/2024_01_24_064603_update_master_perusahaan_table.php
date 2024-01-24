<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('master_perusahaan', function (Blueprint $table) {
            $table->dropColumn(['nama_pj', 'jabatan_pj']);
            $table->unsignedBigInteger('penanggung_jawab_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Schema::table('master_perusahaan', function (Blueprint $table) {
        //     $table->string('nama_pj');
        //     $table->string('jabatan_pj');
        // });
    }
};
