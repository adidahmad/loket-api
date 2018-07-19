<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MsEvent extends Model
{
    protected $fillable = [
        'eventName','eventCode','eventStartDate','eventEndDate','categoryID','locationID'
    ];
}
