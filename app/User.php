<?php

namespace App;

use App\Models\Garage;
use App\Models\GarageReview;
use App\Models\Token;
use App\Notifications\ResetPasswordNotification;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens,Notifiable;

    protected $appends =['image_url'];
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','image' , 'mobile','role'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    const  role = [
        'customer',
        'garage',
    ];
    const  NewUserValidationRule =[
        'name' => 'required|string|max:100',
        'email' => ['required', 'string', 'email', 'max:191', 'unique:users'],
        'mobile' => 'required|string',
        'device_type' => 'required|string',
        'fcm_token' => 'required|string',
        'password' => 'required|string|min:6'
    ];

    const  LoginUserValidationRule =[
        'fcm_token' => 'required|string',
        'email' => ['required', 'string', 'email', 'max:191'],
        'device_type' => 'required|string|in:ios,android',
        'password' => 'required|string|min:6'
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


    public function tokens(){
        return $this->hasMany(Token::class);
    }
    public function garage(){
        return $this->hasOne(Garage::class);
    }

    public function reviews()
    {
        return $this->hasMany(GarageReview::class);
    }
    public function setPasswordAttribute($value)
    {
        $this->attributes['password'] = bcrypt($value);

    }



    public function getImageUrlAttribute()
    {

        return empty($this->image)?
            ($this->role==='garage' ? website_assets('images/qr3.png'):image_url('user.png'))
             :
            image_storage_url($this->image);

    }


}
