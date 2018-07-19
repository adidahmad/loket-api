<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMsEventsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ms_events', function (Blueprint $table) {
            $table->increments('id');
            $table->string('eventName');
            $table->string('eventCode', 5)->unique();
            $table->datetime('eventStartDate');
            $table->datetime('eventEndDate');
            $table->unsignedInteger('locationID');
            $table->foreign('locationID')->references('id')->on('ms_locations')->onDelete('cascade');
            $table->unsignedInteger('categoryID');
            $table->foreign('categoryID')->references('id')->on('ms_categories')->onDelete('cascade');
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
        Schema::dropIfExists('ms_events');
    }
}
