<?php

use Illuminate\Database\Seeder;

class LanuageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \Illuminate\Support\Facades\Schema::disableForeignKeyConstraints();
        \App\Models\Language::truncate();
        \App\Models\LanguageTranslation::truncate();


        \App\Models\Language::create([
            'lang' => 'ar',
            'flag' => 'ar.png',
            'ar' => [
                'name' => 'عربي'
            ],
            'en' => [
                'name' => 'Arabic'
            ]
        ]);
        \App\Models\Language::create([
            'lang' => 'en',
            'flag' => 'en.png',
            'ar' => [
                'name' => 'انجليزي'
            ],
            'en' => [
                'name' => 'English'
            ]
        ]);

        \Illuminate\Support\Facades\Schema::enableForeignKeyConstraints();
    }
}
