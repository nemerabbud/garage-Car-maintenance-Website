<?php

namespace App\Models;

use Astrotomic\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Plan extends Model
{
    use  SoftDeletes;
    use  Translatable;

    protected  $guarded = [] ;
    public $translatedAttributes = ['description', 'title'];

    protected $hidden=['translations'];
    public function scopeActive($query)
    {
        return $query->where('status','active');
    }
}
