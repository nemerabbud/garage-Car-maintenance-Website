<?php

use Illuminate\Database\Seeder;

class GarageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \Illuminate\Support\Facades\Schema::disableForeignKeyConstraints();

        \App\Models\Garage::truncate();
        \App\Models\GarageImage::truncate();
        \App\Models\GarageTranslation::truncate();
        $categories = \App\Models\Category::with('services')->get();
        factory(\App\Models\Garage::class, 30)->create()->each(function ($garage) use ($categories) {


            $car_types = \App\Models\CarType::get()->random(4)->pluck('id');
            $services = $categories->where('id',$garage->category_id)->first()->services()->pluck('id')->toArray();
            factory(\App\Models\GarageTranslation::class)->create(['garage_id'=>$garage->id,'locale'=>'ar', 'name'=>'كراج بلدنا' ,'address'=>'السعودية - الرياض - حي عرقه']);
            factory(\App\Models\GarageTranslation::class)->create(['garage_id'=>$garage->id,'locale'=>'en', 'name'=>'Pladna Garage','address'=>'KSA - Alryad - Souad King Str']);
            factory(\App\Models\GarageImage::class ,4)->create(['garage_id'=>$garage->id]);

            $garage->services()->sync($services);
            $garage->carTypes()->sync($car_types);

        });

        \Illuminate\Support\Facades\Schema::enableForeignKeyConstraints();
    }
}
