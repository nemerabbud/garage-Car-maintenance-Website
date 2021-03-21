<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Category;
use Faker\Generator as Faker;

$factory->define(\App\Models\CategoryTranslation::class, function (Faker $faker) {
    return [
        'locale'=>'ar',
         'title'=>$faker->title,

    ];
});
