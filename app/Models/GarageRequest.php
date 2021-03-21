<?php

namespace App\Models;

use Astrotomic\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;

class GarageRequest extends Model
{
    use Translatable;

    protected $guarded = [];
    public $translatedAttributes = ['description', 'address', 'title'];
    const status = ['accepted', 'rejected', 'waiting'];
    protected $appends = ['logo_url', 'commercial_license_image_url'];

    public function getLogoUrlAttribute()
    {
        return image_storage_url('thumbnail/' . $this->logo);

    }

    public function getCommercialLicenseImageUrlAttribute()
    {
        return image_storage_url('thumbnail/' . $this->commercial_license_image);

    }

}
