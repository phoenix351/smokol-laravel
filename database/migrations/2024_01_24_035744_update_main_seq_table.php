<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use PhpParser\ErrorHandler\Throwing;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {

        Schema::table('maintenance_sequences', function (Blueprint $table) {
            $table->date('estimasi_penyelesaian')->nullable();
            $table->unsignedBigInteger('perusahaan_id');
            // $table->foreign('perusahaan_id')->references('id')->on('maser_perusahaan');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
        Schema::table('maintenance_sequences', function (Blueprint $table) {
            $table->dropColumn('estimasi_penyelesaian');

            // $table->dropForeign(['perusahaan_id']);
            $table->dropColumn('perusahaan_id');
        });
    }
};
