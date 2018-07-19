<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TrEventTicket extends Model
{
    protected $fillable = [
        'price','eventID','ticketTypeID'
    ];
}
