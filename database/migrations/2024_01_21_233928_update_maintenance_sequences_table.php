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
        Schema::table('maintenance_sequences', function (Blueprint $table) {
            $table->string('problems', 511)->nullable();
            $table->string('next_step', 1)->nullable();
            $table->string('solution', 255)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        try {
            //code...
            Schema::table('maintenance_sequences', function (Blueprint $table) {
                $table->dropColumn('problems');
                $table->dropColumn('next_step');
                $table->dropColumn('solution');
            });
        } catch (\Exception $e) {
            //throw $th;
        }
    }
};
