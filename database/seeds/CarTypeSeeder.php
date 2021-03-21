<?php

use Illuminate\Database\Seeder;

class CarTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \Illuminate\Support\Facades\Schema::disableForeignKeyConstraints();
        \App\Models\CarType::truncate();
//        factory(\App\Models\CarType::class,20)->create();

        $data = [
            ['title'=>'Kia'],
            ['title'=>'Abarth'],
            ['title'=>'Acura'],
            ['title'=>'Aston Martin	'],
            ['title'=>'BMW'],
            ['title'=>'Buick'],
            ['title'=>'Cadillac'],
            ['title'=>'Chevrolet'],
            ['title'=>'Chrysler'],
            ['title'=>'Citreon'],
            ['title'=>'Dacia'],
            ['title'=>'Dodge'],
        ];
        \App\Models\CarType::insert($data);
        \Illuminate\Support\Facades\Schema::enableForeignKeyConstraints();
    }
}
