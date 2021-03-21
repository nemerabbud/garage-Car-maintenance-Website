<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\AdsResource;
use App\Http\Resources\CarTypeResource;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\OrderInfoResource;
use App\Http\Resources\OrderResource;
use App\Http\Resources\PageResource;
use App\Http\Resources\ServiceResource;
use App\Http\Resources\SliderResource;
use App\Models\Advertisement;
use App\Models\CarType;
use App\Models\Category;
use App\Models\Order;
use App\Models\Page;
use App\Models\Plan;
use App\Models\Service;
use App\Models\Setting;
use App\Models\Slider;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;

class SettingController extends SupperController
{
    public function __construct()
    {

        parent::__construct();


    }

    public function get_setting()
    {


        $settings = Setting::first();


        return response(['status' => true, 'code' => 200, 'message' => __('api.ok'), 'settings' => $settings]);

    }

    public function get_plans()
    {


        $plans = Plan::active()->get();


        return response(['status' => true, 'code' => 200, 'message' => __('api.ok'), 'plans' => $plans]);

    }

    public function get_carTypes()
    {
        $car_types = CarType::get();

        return response(['status' => true, 'code' => 200, 'message' => __('api.ok'), 'car_types' => CarTypeResource::collection($car_types)]);

    }


    public function get_ads()
    {
        $items = Advertisement::where('status', 'active')->get();

        return response(['status' => true, 'code' => 200, 'message' => __('api.ok'), 'items' => AdsResource::collection($items)]);

    }

    public function get_sliders()
    {
        $items = Slider::where('status', 'active')->get();

        return response(['status' => true, 'code' => 200, 'message' => __('api.ok'), 'items' => SliderResource::collection($items)]);

    }


    public function get_pages()
    {
        $items = Page::get();

        return response(['status' => true, 'code' => 200, 'message' => __('api.ok'), 'items' => PageResource::collection($items)]);

    }
}
