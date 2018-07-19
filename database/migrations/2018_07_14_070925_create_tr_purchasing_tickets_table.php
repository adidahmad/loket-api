<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTrPurchasingTicketsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tr_purchasing_tickets', function (Blueprint $table) {
            $table->increments('id');
            $table->string('transCode');
            $table->unsignedInteger('eventTicketID');
            $table->foreign('eventTicketID')->references('id')->on('tr_event_tickets')->onDelete('cascade');
            $table->unsignedInteger('custID');
            $table->foreign('custID')->references('id')->on('ms_customers')->onDelete('cascade');
            $table->integer('quantity');
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
        Schema::dropIfExists('tr_purchasing_tickets');
    }
}
