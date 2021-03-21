<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\CarTypeRequest;
use App\Http\Requests\CategoryRequest;
use App\Http\Requests\PlanRequest;
use App\Models\CarType;
use App\Models\Category;
use App\Models\Language;
use App\Models\Plan;
use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;

class ServicesController extends SupperController
{


    public function __construct()
    {
        parent::__construct();
        $this->route = "services";
        $this->path = "admin.services";

    }

    public function index()
    {
        $items = Service::latest()->get();

        return view("{$this->path}.home", ['items' => $items]);

    }


    public function create()
    {
        $categories = Category::all();
        return view("{$this->path}.create", compact('categories'));
    }


    public function store(Request $request)
    {

        $locales = Language::all()->pluck('lang');

        $roles = [
            'image' => 'required|image|mimes:jpeg,jpg,png,gif',
            'category_id' => 'required|numeric|exists:categories,id',
        ];
        foreach ($locales as $locale) {
            $roles[$locale] = 'required|array';
            $roles["$locale.title"] = 'required|string';
        }


        $data = $this->validate($request, $roles);
        if ($request->hasFile('image')) {

            /// call helper function to store new image and return  path new image and delete old images
            $data['image'] = storeImage($request->file('image'), 'services');
        }

        Service::create($data);



        return redirect()->back()->with('status', __('cp.create'));
    }


    public function show($id)
    {
        //
    }


    public function edit(Service $service)
    {
        $categories = Category::all();
        return view("{$this->path}.edit", ['item' => $service, 'categories' => $categories]);
    }

    public function update(Request $request, Service $service)
    {

        $locales = Language::get()->pluck('lang');

        $roles = [

            'image' => 'nullable|image|mimes:jpeg,jpg,png,gif',
            'category_id' => 'required|numeric|exists:categories,id'

        ];

        foreach ($locales as $locale) {
            $roles[$locale] = 'required|array';
            $roles["$locale.title"] = 'required|string';
        }


        $data = $this->validate($request, $roles);
        if ($request->hasFile('image')) {

            /// call helper function to store new image and return  path new image and delete old images
            $data['image'] = storeImage($request->file('image'), 'services', $service->image);
        }


        $old_category_id = $service->category_id;
        $service->update($data);


        if ($old_category_id !== $request->category_id) {// check if old category id not eqaul new  category
            /// start update count  services to old category
            $count_services = Service::active()->where('category_id', $old_category_id)->count();

            Category::where('id', $request->category_id)->update(['count_services' => $old_category_id]);
            /// end update count  services to old category


        }//end if

        /** make it in observer ServiceObserver */


        return redirect()->back()->with('status', __('cp.update'));

    }


    public function destroy(Service $service)
    {

        $service->delete();
        return response()->json(['status' => true, 'message' => 'success']);


    }
}
