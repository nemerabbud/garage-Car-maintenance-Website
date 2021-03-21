<?php

use Illuminate\Database\Seeder;

class PlanSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \Illuminate\Support\Facades\Schema::disableForeignKeyConstraints();
        \App\Models\Plan::truncate();
        factory(\App\Models\Plan::class)->create()->each(function ($plan) {
            factory(\App\Models\PlanTranslation::class)->create(['plan_id' => $plan->id]);
        });

        \Illuminate\Support\Facades\Schema::enableForeignKeyConstraints();
    }
}
