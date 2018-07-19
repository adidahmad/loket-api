<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// create new location
Route::post('location/create', 'LocationController@createLocation');

// create new event
Route::post('event/create', 'EventController@createEvent');

// create new ticket type on one specific event
Route::post('event/ticket/create', 'EventController@createEventTicket');

// retrieve event information, including location data and ticket data
Route::get('event/get_info/{id}', 'EventController@getEventDetail');

// make a new purchase and customer data
Route::post('transaction/purchase', 'TransactionController@purchaseTicket');

// retrieve transaction created using endpoint Purchase Ticket
Route::get('transaction/get_info/{transCode}', 'TransactionController@getTransactionDetail');