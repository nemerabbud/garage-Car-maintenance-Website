<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class CategoryController extends Controller
{


    public function __construct()
    {
        $this->path = "website.categories";
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, $category_slug)
    {

        $category = Category::with('services', 'services.garages', 'services.garages.user');
        if ($request->has('service_id') || $request->has('search')) {
            $category->with(['services.garages' => function ($garage) use ($request) {
                if ($request->has('service_id'))
                    $garage->whereHas('services', function ($query) {
                        $query->where('id', \request()->service_id);
                    });

                if ($request->has('search'))
                    $garage->whereHas('user', function ($query) use($request) {
                        $query->where('name','like',"%$request->search%");
                    });


            }]);
        }


        $category = $category->whereHas('translations',function ($query) use ($category_slug){
         $query->where('slug',$category_slug);
        })->firstOrFail();

        $garages = $category->services->pluck('garages')->collapse()->unique('id');

        return view("{$this->path}.index", compact('garages', 'category'));
    }

    public function categories (){
       $categories =  Category::active()->paginate(12);
       return view("{$this->path}.all_categories",compact('categories'));
    }


}
