<?php

namespace App\Providers;

use App\Models\ContactUs;
use App\Models\Garage;
use App\Models\GarageRequest;
use App\Models\GarageReview;
use App\Models\Language;
use App\Models\Order;
use App\Models\Setting;
use App\Observers\GarageReviewObserver;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);

        GarageReview::observe(GarageReviewObserver::class);


        view()->composer('admin.*', function ($view)
        {
            $locales = Language::all();
            $contact =  ContactUs::whereNull('read_at')->count();
            $garage_request =  GarageRequest::whereStatus('waiting')->count();

            $settings = Setting::first();
            $new_orders_count = Order::whereStatus('waiting')->count();


            //...with this variable
            $view->with([
                'locales' => $locales,
                'settings' => $settings,
                'contact' => $contact,
                'garage_request' => $garage_request,
                'new_orders_count' => $new_orders_count,


            ]);
        });


    }
}
