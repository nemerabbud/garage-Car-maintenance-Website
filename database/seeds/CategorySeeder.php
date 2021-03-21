<?php

use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \Illuminate\Support\Facades\Schema::disableForeignKeyConstraints();
        \App\Models\Category::truncate();
        \App\Models\CategoryTranslation::truncate();

        $data = [
            [
                'image' => 'icon-car.svg',
                'en' => ['title' => 'Bicycle Maintenance'],
                'ar' => ['title' => 'صيانة الدراجات'],

            ],
            [
                'image' => 'icon-car.svg',
                'en' => ['title' => 'Car Maintenance'],
                'ar' => ['title' => 'صيانة السيارات'],

            ],
            [
                'image' => 'icon-car.svg',
                'en' => ['title' => 'Steamer Maintenance'],
                'ar' => ['title' => 'صيانة المراكب'],

            ],
        ];

        $items = [];
        foreach ($data as $item) {
            for ($i = 1; $i < 4; ++$i) {
                $el = $item;
                $el['en']['title'] = $item['en']['title']."  $i";
                $el['ar']['title'] = $item['ar']['title']."  $i";
                \App\Models\Category::create($el);
            }
        }


//        \App\Models\Category::insert($items);
//        factory(\App\Models\Category::class,20)->create()->each(function ($cat){
//            factory(\App\Models\CategoryTranslation::class)->create(['category_id'=>$cat->id]);
//        });
        \Illuminate\Support\Facades\Schema::enableForeignKeyConstraints();
    }
}
