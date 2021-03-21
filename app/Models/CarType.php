<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CarType extends Model
{
    protected $guarded = [];

    function  scopeActive($query){
        return $query->where('status','active');
    }
}
