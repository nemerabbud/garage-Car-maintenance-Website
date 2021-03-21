<?php

use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \Illuminate\Support\Facades\Schema::disableForeignKeyConstraints();
        \App\User::truncate();
        factory(\App\User::class,20)->create();
        \Illuminate\Support\Facades\Schema::enableForeignKeyConstraints();
    }
}
