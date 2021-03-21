<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Garage;
use Faker\Generator as Faker;

$factory->define(\App\Models\GarageImage::class, function (Faker $faker) {
//    $garages_ids = \App\Models\Garage::pluck('id')->toArray();
    return [
        'image'=>'slick.png',
//        'garage_id'=>$faker->randomElement($garages_ids),

    ];
});
