<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSettingTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('setting_translations', function (Blueprint $table) {
            $table->id();
            $table->string('locale')->index();
            $table->string('address')->nullable();
            $table->string('title')->nullable();
            $table->text('description')->nullable();
            $table->text('download_app_text')->nullable();
            $table->timestamps();
            $table->unsignedBigInteger('setting_id')->nullable();
            $table->foreign('setting_id')->on('settings')->references('id')->nullOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('setting_translations');
    }
}
