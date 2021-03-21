<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GarageImage extends Model
{
    protected $guarded = [];
    protected $appends = ['image_url'];

    public function getImageUrlAttribute()
    {
        return $this->image ==="slick.png"?
            image_url('slick.png') :
            image_storage_url($this->image);

    }


}
