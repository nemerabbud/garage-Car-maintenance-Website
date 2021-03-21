<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Garage;
use Faker\Generator as Faker;

$factory->define(\App\Models\GarageTranslation::class, function (Faker $faker) {
    $category_ids = \App\Models\Category::pluck('id')->toArray();
    return [

            'description'=>$faker->text(100),
            'address'=>$faker->address,

    ];
});
