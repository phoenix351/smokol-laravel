<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        try {
            Schema::table('maintenances', function (Blueprint $table) {
                $table->unsignedBigInteger('users_id')->default('5');
                $table->foreign('users_id')->references('id')->on('users')->onUpdate('CASCADE');
            });
        } catch (\Exception $e) {
            $this->down();
            throw $e;
        }
        DB::table('maintenances')
            ->join('maintenance_sequences', 'maintenance_sequences.id', '=', 'maintenances.sequence_id')
            ->join('users', 'users.id', '=', 'maintenance_sequences.users_id')
            ->update(['maintenances.users_id' => DB::raw('users.id')]);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        try {
            //code...
            Schema::table('maintenances', function (Blueprint $table) {
                $table->dropColumn('users_id');
                $table->dropForeign(['users_id']);
            });
        } catch (\Throwable $th) {
        }
    }
};
