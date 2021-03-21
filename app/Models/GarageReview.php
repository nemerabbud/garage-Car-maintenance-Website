<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;

class GarageReview extends Model
{
 protected $guarded =[];

 const ReviewValidation =[
     'garage_id' => 'required|numeric|exists:garages,id',
     'order_id' => 'required|numeric|exists:orders,id',
     'rate' => 'required|numeric',
     'content' => 'required|string',

 ];

 function  user(){
     return $this->belongsTo(User::class);
 }
}
