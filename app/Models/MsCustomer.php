<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MsCustomer extends Model
{
    protected $fillable = [
        'custName','custEmail','custPhone','custAddress'
    ];
}
