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
        Schema::create('banners', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('language_id');
            $table->foreign('language_id')->references('id')->on('languages')->onDelete('cascade');
            $table->enum('style', ['style1', 'style2', 'style3'])->default('style1');
            $table->string('section_image')->nullable();
            $table->text('title')->nullable();
            $table->text('description')->nullable();
            $table->text('button_name')->nullable();
            $table->text('button_url')->nullable();
            $table->text('button_name_2')->nullable();
            $table->text('button_url_2')->nullable();
            $table->string('button_image')->nullable();
            $table->text('button_image_url')->nullable();
            $table->string('button_image_2')->nullable();
            $table->text('button_image_url_2')->nullable();
            $table->string('button_image_3')->nullable();
            $table->text('button_image_url_3')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('banners');
    }
};
