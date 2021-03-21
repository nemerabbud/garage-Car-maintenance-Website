<?php

namespace App\Observers;

use App\Models\Category;
use App\Models\Service;

class ServiceObserver
{
    /**
     * Handle the service "created" event.
     *
     * @param  \App\Models\Service  $service
     * @return void
     */
    public function created(Service $service)
    {
        $category = Category::with('services')->find($service->category_id);
        $services_count  = $category->services->where('status','active')->count();
        $category->update(['count_services'=>$services_count]);
    }

    /**
     * Handle the service "updated" event.
     *
     * @param  \App\Models\Service  $service
     * @return void
     */
    public function updated(Service $service)
    {
        $category = Category::with('services')->find($service->category_id);
        $services_count  = $category->services->where('status','active')->count();
        $category->update(['count_services'=>$services_count]);
    }

    /**
     * Handle the service "deleted" event.
     *
     * @param  \App\Models\Service  $service
     * @return void
     */
    public function deleted(Service $service)
    {
        //
    }

    /**
     * Handle the service "restored" event.
     *
     * @param  \App\Models\Service  $service
     * @return void
     */
    public function restored(Service $service)
    {
        //
    }

    /**
     * Handle the service "force deleted" event.
     *
     * @param  \App\Models\Service  $service
     * @return void
     */
    public function forceDeleted(Service $service)
    {
        //
    }
}
