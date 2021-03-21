<?php

namespace App\Models;

use Astrotomic\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;

class Notify extends Model
{
    use  Translatable;
    protected $guarded  =[];
    public $translatedAttributes = ['title','message'];
    protected $hidden  =['translations'];

}
