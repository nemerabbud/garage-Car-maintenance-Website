<?php

namespace App\Models;

use Astrotomic\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Language extends Model
{
    use  Translatable;

    public $translatedAttributes = ['name'];
    protected $guarded = [];


    public function getFlagAttribute($flag){
        return $flag?url($flag):null;
    }
}
