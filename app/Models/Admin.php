<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Admin extends Authenticatable
{
    protected $guarded = [];

    protected $appends = ['image_url'];

    public function setPasswordAttribute($value)
    {
        $this->attributes['password'] = bcrypt($value);

    }

    public function getImageUrlAttribute()
    {
        return image_url('user.png');

    }


    public function permission()
    {
        return $this->hasOne(UserPermission::class, 'user_id');
    }

}
