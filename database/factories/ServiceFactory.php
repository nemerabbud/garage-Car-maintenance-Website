<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Service;
use Faker\Generator as Faker;

$factory->define(Service::class, function (Faker $faker) {
    $category_ids = \App\Models\Category::pluck('id')->toArray();
    return [
        'image'=>'1.png',
        'category_id'=>$faker->randomElement($category_ids),
    ];
});
