<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTrEventTicketsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tr_event_tickets', function (Blueprint $table) {
            $table->increments('id');
            $table->double('price');
            $table->unsignedInteger('eventID');
            $table->foreign('eventID')->references('id')->on('ms_events')->onDelete('cascade');
            $table->unsignedInteger('ticketTypeID');
            $table->foreign('ticketTypeID')->references('id')->on('ms_ticket_types')->onDelete('cascade');
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
        Schema::dropIfExists('tr_event_tickets');
    }
}
