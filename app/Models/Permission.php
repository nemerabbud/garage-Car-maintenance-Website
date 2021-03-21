<?php

namespace App\Models;

use Astrotomic\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    use  Translatable;
    protected  $guarded=[] ;
    public $translatedAttributes = ['name'];

}
