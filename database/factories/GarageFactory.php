<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Garage;
use Faker\Generator as Faker;

$factory->define(Garage::class, function (Faker $faker) {
    $category_ids = \App\Models\Category::pluck('id')->toArray();
    $plan = \App\Models\Plan::first();
    return [
        'user_id'=>factory(\App\User::class)->create(['role'=>'garage'])->id,
        'category_id'=>$faker->randomElement($category_ids),
        'lat'=>$faker->latitude,
        'lng'=>$faker->longitude,
        'plan_id'=>$plan->id,
        'start_date'=>now(),
        'end_date'=>\Carbon\Carbon::parse(now())->addDays($plan->duration),


    ];
});
