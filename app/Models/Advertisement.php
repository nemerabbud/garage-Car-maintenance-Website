<?php

namespace App\Models;

use Astrotomic\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;

class Advertisement extends Model
{
    use Translatable;
    protected $guarded = [];
    public $translatedAttributes = ['title','description'];


    public function getImageUrlAttribute()
    {
        return   image_storage_url('thumbnail/' . $this->image);

    }


}
