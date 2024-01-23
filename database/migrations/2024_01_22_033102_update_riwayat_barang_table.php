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
        DB::statement("ALTER TABLE `riwayat_barang` CHANGE `pengguna_id` `users_id` BIGINT(20) UNSIGNED NOT NULL;");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
        DB::statement("ALTER TABLE `riwayat_barang` CHANGE `users_id` `pengguna_id`  BIGINT(20) UNSIGNED NOT NULL;");
    }
};
