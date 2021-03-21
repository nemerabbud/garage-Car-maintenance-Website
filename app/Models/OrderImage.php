<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;

class OrderImage extends Model
{



    protected $guarded = [];
    protected $appends = ['image_url'];

    public function getImageUrlAttribute()
    {
        return  image_storage_url( $this->image);

    }






}
