<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(SettingSeeder::class);
         $this->call(CategorySeeder::class);
         $this->call(ServiceSeeder::class);
         $this->call(LanuageSeeder::class);
         $this->call(PlanSeeder::class);
         $this->call(CarTypeSeeder::class);
         $this->call(UserSeeder::class);
         $this->call(GarageSeeder::class);
         $this->call(AdminSeeder::class);
         $this->call(PermissionSeeder::class);
    }
}
