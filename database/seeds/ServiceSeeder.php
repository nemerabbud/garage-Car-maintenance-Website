<?php

use Illuminate\Database\Seeder;

class ServiceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        \Illuminate\Support\Facades\Schema::disableForeignKeyConstraints();
        \App\Models\Service::truncate();
        \App\Models\ServiceTranslation::truncate();

        $categories = \App\Models\Category::get();
        $data = [
            [
                'image' => 'mascara.png',
                'en' => ['title' => 'Bicycle service'],
                'ar' => ['title' => 'خدمة الدراجات'],

            ],
            [
                'image' => 'mascara.png',
                'en' => ['title' => 'Car service'],
                'ar' => ['title' => 'خدمة السيارات'],

            ],
            [
                'image' => 'mascara.png',
                'en' => ['title' => 'Steamer service'],
                'ar' => ['title' => 'خدمة المراكب'],

            ],
        ];

        $items = [];
        foreach ($data as $item) {
            foreach ($categories as $category) {
                $el = $item;
                $el['category_id']= $category->id;
                $el['en']['title'] = $item['en']['title']."  $category->id";
                $el['ar']['title'] = $item['ar']['title']."  $category->id";
                \App\Models\Service::create($el);
            }
        }
      /*  factory(\App\Models\Service::class,100)->create()->each(function ($ser){
            factory(\App\Models\ServiceTranslation::class)->create(['service_id'=>$ser->id]);
        });*/
        \Illuminate\Support\Facades\Schema::enableForeignKeyConstraints();

    }
}
