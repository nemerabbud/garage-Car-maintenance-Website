<?php

namespace App\Models;

use Astrotomic\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;

class Service extends Model
{

    use  Translatable;

    public $translatedAttributes = ['title'];
    protected $table = 'services';
    protected $guarded = [];
    protected $withCount = ['garages'];

    protected $appends = ['image_url'];

    protected $hidden = ['translations'];

    public function garages()
    {
        return $this->belongsToMany(Garage::class, 'garage_service');
    }



    public function getImageUrlAttribute()
    {
        return $this->image ==="mascara.png"?
            image_url('mascara.png') :
            image_storage_url('thumbnail/' . $this->image);

    }


//    public function getImageUrlAttribute()
//    {
//        return image_storage_url('thumbnail/' . $this->image);
//
//    }


    public function setImageAttribute($value)
    {

        $this->attributes['image'] = storeImage($value, 'services', $this->image);


    }


    public function scopeActive($query)
    {
        return $query->where('status', 'active');
    }
}
