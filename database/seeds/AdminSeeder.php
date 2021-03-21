<?php

use Illuminate\Database\Seeder;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\Admin::truncate();
        \App\Models\Admin::create([
            'name'=>'Weenah',
            'email'=>'admin@weenah.com',
            'password'=>123456789,
        ]);
    }
}
