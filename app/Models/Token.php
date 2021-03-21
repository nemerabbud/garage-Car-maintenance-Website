<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;

class Token extends Model
{
    protected  $guarded =  [];
    const  FCMValidationRule =[
        'device_type' => 'required|string',
        'fcm_token' => 'required|string',
        'accept_notification' => 'nullable|boolean'
    ];


    public function  user(){
        return $this->belongsTo(User::class);
    }


    public function  scopeAcceptNotification($query){
        return $query->where('accept_notification',true);
    }
}
