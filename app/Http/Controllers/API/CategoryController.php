<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\Ads as AdsResource;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\ServiceResource;
use App\Models\Category;
use App\Models\Service;
use Illuminate\Http\Request;

class CategoryController extends SupperController
{
    public function __construct()
    {

        parent::__construct();
    }

    public function get_categories()
    {

        $categories = Category::active()->get();

        $message = __('api.ok');


        return response()->json(['status' => true, 'code' => 200, 'message' => $message, 'categories' => CategoryResource::collection($categories)]);


    }


    public function get_category_services($category_id)
    {

        $services = Service::active()->where('category_id', $category_id)->get();

        $message = __('api.ok');

        return response()->json(['status' => true, 'code' => 200, 'message' => $message, 'services' => ServiceResource::collection($services)]);


    }
}
