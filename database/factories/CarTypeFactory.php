<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Category;
use Faker\Generator as Faker;

$factory->define(\App\Models\CarType::class, function (Faker $faker) {
    return [
        'title'=>$faker->text(20),

    ];
});
