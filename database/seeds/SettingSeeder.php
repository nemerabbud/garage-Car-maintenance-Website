<?php

use Illuminate\Database\Seeder;

class SettingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \Illuminate\Support\Facades\Schema::disableForeignKeyConstraints();
        \App\Models\Setting::truncate();
        \App\Models\SettingTranslation::truncate();

        $data = [
            'facebook' => 'www.facebook.com',
            'instagram' => 'www.instagram.com',
            'twitter' => 'www.twitter.com',
            'mobile' => '059500000000',
            'email' => 'info@rahegcom.com',
            'logo' => 'settings/fNbN4ZupnfzVlS4BNdcEeUaWBQSspqU3vb2ggzFK.png',
            'favicon' => 'settings/CfJfjnJvnPssFiALDGsvqCOACVUo9kUGAJy2z2Kp.png',
            'image' => 'settings/Rz5UifsEaWsVdcyXXdt35V91C6zfYg88N3CdlD7c.png',
            'en' => [
                'title' => 'Weenah',
                'description' => 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                'download_app_text' => 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                'address' => 'السعودية - الرياض - حي عرقه',
            ],
            'ar' => [
                'title' => 'ويينه',
                'description' => 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                'download_app_text' => 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                'address' => 'السعودية - الرياض - حي عرقه',
            ],
        ];
        \App\Models\Setting::create($data);
        \Illuminate\Support\Facades\Schema::enableForeignKeyConstraints();
    }
}
