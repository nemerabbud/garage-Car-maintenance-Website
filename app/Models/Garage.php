<?php

namespace App\Models;

use App\User;
use Astrotomic\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;

class Garage extends Model
{
    use Translatable;

    protected $guarded = [];
    public $translatedAttributes = ['description', 'address','name','slug'];

//    protected $withCount = ['services'];

//    protected $appends = [ 'rate'];
    protected $with=['user'];



    public function services()
    {
        return $this->belongsToMany(Service::class, 'garage_service');
    }


    public function plan()
    {
        return $this->belongsTo(Plan::class);
    }

    public function carTypes()
    {
        return $this->belongsToMany(CarType::class, 'garage_car_type');
    }

    public function reviews()
    {
        return $this->hasMany(GarageReview::class);
    }


    public function images()
    {
        return $this->hasMany(GarageImage::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }


    public function orders()
    {
        return $this->hasMany(Order::class);
    }


//    public function getRateAttribute()
//    {
//        $reviews = $this->reviews();
//        $count = $reviews->count();
//        $sum = $reviews->sum('rate');
//
//        return $count == 0 ? 0 : number_format(($sum / $count), 2);
//    }



    public function saveImages($images){

        if (is_array($images) && count($images)>0){
            $img_data=[];
            foreach ($images as $img){
                $img_data[]['image']= $img;
            }
            $this->images()->createMany($img_data);
        }
    }

    public function scopeActive($query)
    {
        return $query->where('status','active');
    }
    /*  public function getDistanceAttribute()
      {
          if (request()->has('lat') && request()->has('lng'))
              return distance($this->lat, request()->lat, $this->lng, request()->lng);
          return 0;
      }*/


}
