<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\PlanTranslation;
use Faker\Generator as Faker;

$factory->define(PlanTranslation::class, function (Faker $faker) {
    return [
        'locale'=>'ar',
        'title'=>'حزمة شهرية',
        'description'=>$faker->text(50),
    ];
});
