<?php

namespace App\Models;

use Astrotomic\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;

class Category extends Model
{
    use Translatable;
    protected $guarded = [];
    public $translatedAttributes = ['title','slug'];

//    protected $withCount = ['services'];

    protected $appends = ['image_url'];
//    protected $hidden = ['translations'];



    public function services()
    {
       return $this->hasMany(Service::class);
    }


    public function getImageUrlAttribute()
    {
        return $this->image ==="icon-car.svg"?
            image_url('icon-car.svg') :
            image_storage_url('thumbnail/' . $this->image);

    }

    public  function scopeActive($query){
        return $query->where('status','active');
    }

}
