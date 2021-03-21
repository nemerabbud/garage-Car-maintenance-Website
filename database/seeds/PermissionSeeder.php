<?php

use Illuminate\Database\Seeder;

class PermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \Illuminate\Support\Facades\Schema::disableForeignKeyConstraints();
        $data = [

            [
                'roleSlug' => 'users',
                'en' => [
                    'name' => 'Customers'
                ],
                'ar' => [
                    'name' => 'العملاء'
                ],
            ], [
                'roleSlug' => 'car-type',
                'en' => [
                    'name' => 'Car Type'
                ],
                'ar' => [
                    'name' => 'أنواع السيارات'
                ],
            ],
            [
                'roleSlug' => 'categories',
                'en' => [
                    'name' => 'Categories'
                ],
                'ar' => [
                    'name' => 'التصنيفات'
                ],
            ], [
                'roleSlug' => 'garages',
                'en' => [
                    'name' => 'Garages'
                ],
                'ar' => [
                    'name' => 'الكراجات'
                ],
            ],
            [
                'roleSlug' => 'orders',
                'en' => [
                    'name' => 'Orders'
                ],
                'ar' => [
                    'name' => 'الطلبات'
                ],
            ], [
                'roleSlug' => 'contact-us',
                'en' => [
                    'name' => 'Contact us'
                ],
                'ar' => [
                    'name' => 'رسائل اتصل بنا'
                ],
            ],
            [
                'roleSlug' => 'settings',
                'en' => [
                    'name' => 'Settings'
                ],
                'ar' => [
                    'name' => 'الاعدادات'
                ],
            ],
            [
                'roleSlug' => 'plans',
                'en' => [
                    'name' => 'Plans'
                ],
                'ar' => [
                    'name' => 'خطط الاشتراك'
                ],
            ], [
                'roleSlug' => 'services',
                'en' => [
                    'name' => 'Services'
                ],
                'ar' => [
                    'name' => 'الخدمات'
                ],
            ],
            [
                'roleSlug' => 'admins',
                'en' => [
                    'name' => 'Admins'
                ],
                'ar' => [
                    'name' => 'المدراء والمشرفين'
                ],
            ], [
                'roleSlug' => 'notifications',
                'en' => [
                    'name' => 'Notifications'
                ],
                'ar' => [
                    'name' => 'الإشعارات'
                ],
            ], [
                'roleSlug' => 'advertisements',
                'en' => [
                    'name' => 'advertisements'
                ],
                'ar' => [
                    'name' => 'الإعلانانات'
                ],
            ],[
                'roleSlug' => 'garageRequests',
                'en' => [
                    'name' => 'Garage Requests'
                ],
                'ar' => [
                    'name' => 'طلبات الكراجات'
                ],
            ],
        ];
        \App\Models\Permission::truncate();
        foreach ($data as $item)
        \App\Models\Permission::create($item);


        \Illuminate\Support\Facades\Schema::enableForeignKeyConstraints();
    }
}
