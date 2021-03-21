<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $guarded = [];

    const status= ['accepted','rejected','waiting'];

    const  OrderValidation =[
        'garage_id' => 'required|numeric|exists:garages,id',
        'date' => 'required|string',
        'time' => 'required|string',
        'description' => 'required|string',
        'services' => 'required|array',
        'services.*' => 'required|exists:services,id',
        'images' => 'required|array',
        'images.*' => 'required|image',

    ];

    public function services()
    {
        return $this->belongsToMany(Service::class, 'order_service');
    }


    public function images()
    {
        return $this->hasMany(OrderImage::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }


    public function garage()
    {
        return $this->belongsTo(Garage::class);
    }


    public  function  scopeStatus($query, $status){
        return $query->where('status',$status);
    }
}
