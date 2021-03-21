<?php

use Illuminate\Database\Seeder;

class PageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \Illuminate\Support\Facades\Schema::disableForeignKeyConstraints();
        \App\Models\Page::truncate();
        \App\Models\PageTranslation::truncate();

        $content = '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>

<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ar</p>';
        $data = [
            [
                'name' => 'about_us',
                'en' => [
                    'title' => 'About us',
                    'description' => $content,
                ],
                'ar' => [
                    'title' => 'من نحن',
                    'description' => $content,
                ]
            ],
            [
                'name' => 'privacy_policy',
                'en' => [
                    'title' => 'Privacy Policy',
                    'description' => $content,
                ],
                'ar' => [
                    'title' => 'سياية الخصوصية',
                    'description' => $content,
                ],
            ],
            [
                'name' => 'terms_of_use',
                'en' => [
                    'title' => 'Terms Of Use',
                    'description' => $content,
                ],
                'ar' => [
                    'title' => 'شروط الاستخدام',
                    'description' => $content,
                ],
            ]
        ];

        foreach ($data as $page)
            \App\Models\Page::create($page);
        \Illuminate\Support\Facades\Schema::enableForeignKeyConstraints();
    }
}
