<?php

namespace App\Models;

use Astrotomic\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;

class Page extends Model
{


    use  Translatable;

    public $translatedAttributes = ['title', 'description', 'keywords', 'slug'];


    protected $guarded = [];
    protected $appends = ['image_url'];
    protected $hidden = ['translations'];


    public function getImageUrlAttribute()

    {

        return !is_null($this->image) ?
            image_storage_url($this->image)
            : null;


    }
}
