<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\CarTypeRequest;
use App\Http\Requests\CategoryRequest;
use App\Http\Requests\PlanRequest;
use App\Http\Resources\ServiceResource;
use App\Models\CarType;
use App\Models\Category;
use App\Models\Language;
use App\Models\Plan;
use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;

class CategoryController extends SupperController
{


    public function __construct()
    {
        parent::__construct();
        $this->route = "categories";
        $this->path = "admin.categories";

    }

    public function index()
    {
        $users = Category::latest()->get();

        return view("{$this->path}.home", ['items' => $users]);

    }


    public function create()
    {
        $services = Service::all();
        return view("{$this->path}.create", compact('services'));
    }


    public function store(Request $request)
    {

        $locales = Language::all()->pluck('lang');

        $roles = [
            'image' => 'required|image|mimes:jpeg,jpg,png,gif',
  ];
        foreach ($locales as $locale) {
            $roles[$locale] = 'required|array';
            $roles["$locale.title"] = 'required|string';
        }



        $data = $this->validate($request, $roles);

        if ($request->hasFile('image')) {

            /// call helper function to store new image and return  path new image and delete old images
            $data['image'] = storeImage($request->file('image'), 'categories');
        }

        $category = Category::create($data);



        return redirect()->back()->with('status', __('cp.create'));
    }


    public function show($id)
    {
        //
    }


    public function edit(Category $category)
    {
        return view("{$this->path}.edit", ['item' => $category]);
    }


    public function update(Request $request, Category $category)
    {

        $locales = Language::all()->pluck('lang');

        $roles = [

            'image' => 'nullable|image|mimes:jpeg,jpg,png,gif',
        ];

        foreach ($locales as $locale) {
            $roles[$locale] = 'required|array';
            $roles["$locale.title"] = 'required|string';
        }


        $data = $this->validate($request, $roles);
        if ($request->hasFile('image')) {

            /// call helper function to store new image and return  path new image and delete old images
            $data['image'] = storeImage($request->file('image'), 'categories', $category->image);
        }

        $category->update($data);

        return redirect()->back()->with('status', __('cp.update'));

    }


    public function destroy(Category $category)
    {

        $category->delete();
        return response()->json(['status' => true, 'message' => 'success']);


    }



    public function get_category_services($category_id=0)
    {


        $services = Service::where('category_id', $category_id)->get();

        $message = __('api.ok');

        return response()->json(['status' => true, 'code' => 200, 'message' => $message, 'services' => ServiceResource::collection($services)]);


    }
}
