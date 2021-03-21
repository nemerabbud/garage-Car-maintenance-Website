<?php

namespace App\Models;

use Astrotomic\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;

class Slider extends Model
{
    use Translatable;
    protected $guarded = [];
    public $translatedAttributes = ['title'];


    public function getImageUrlAttribute()
    {
        return   image_storage_url('thumbnail/' . $this->image);

    }


}
