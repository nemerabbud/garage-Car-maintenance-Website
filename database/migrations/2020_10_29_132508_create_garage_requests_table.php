<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGarageRequestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('garage_requests', function (Blueprint $table) {
            $table->id();
            $table->string('lat');
            $table->string('lng');
            $table->string('owner_name');
            $table->string('mobile');
            $table->enum('status',['accepted','rejected','waiting'])->default('waiting');
            $table->string('email');
            $table->string('logo');
            $table->string('commercial_license_image');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('garage_requests');
    }
}
