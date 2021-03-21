<?php

namespace App\Models;

use Astrotomic\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    use Translatable;

    protected  $guarded = [];

    public $timestamps = false;

    public $translatedAttributes = ['title', 'address','description','download_app_text'];
    const  files_name=[
        'logo',
        'image',
        'favicon',

    ];

    protected $hidden=['translations'];
    public  function  getImageAttribute($image)
    {
        return image_storage_url($image);
    }
    public  function  getLogoAttribute($image)
    {
        return image_storage_url($image);
    }
    public  function  getFaviconAttribute($image)
    {
        return image_storage_url($image);
    }
}
