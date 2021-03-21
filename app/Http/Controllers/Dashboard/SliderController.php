<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\CarTypeRequest;
use App\Http\Requests\CategoryRequest;
use App\Http\Requests\PlanRequest;
use App\Http\Resources\ServiceResource;
use App\Models\Advertisement;
use App\Models\CarType;
use App\Models\Category;
use App\Models\Language;
use App\Models\Plan;
use App\Models\Service;
use App\Models\Slider;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;

class SliderController extends SupperController
{


    public function __construct()
    {
        parent::__construct();
        $this->route = "sliders";
        $this->path = "admin.sliders";

    }

    public function index()
    {
        $items = Slider::latest()->get();

        return view("{$this->path}.home", ['items' => $items]);

    }


    public function create()
    {
        return view("{$this->path}.create");
    }


    public function store(Request $request)
    {

        $locales = Language::all()->pluck('lang');

        $roles = [
            'image' => 'required|image|mimes:jpeg,jpg,png,gif',

        ];
        foreach ($locales as $locale) {
            $roles[$locale] = 'required|array';
        //    $roles["$locale.title"] = 'string';
        }


        $data = $this->validate($request, $roles);
        if ($request->hasFile('image')) {

            /// call helper function to store new image and return  path new image and delete old images
            $data['image'] = storeImage($request->file('image'), 'sliders');
        }

         Slider::create($data);
        return redirect()->back()->with('status', __('cp.create'));
    }

    public function show($id)
    {
        //
    }


    public function edit(Slider $slider)
    {
        return view("{$this->path}.edit", ['item' => $slider]);
    }

    public function update(Request $request, Slider $slider)
    {

        $locales = Language::all()->pluck('lang');

        $roles = [

            'image' => 'nullable|image|mimes:jpeg,jpg,png,gif',
        ];

        foreach ($locales as $locale) {
            $roles[$locale] = 'required|array';
          ///  $roles["$locale.title"] = 'string';

        }


        $data = $this->validate($request, $roles);
        if ($request->hasFile('image')) {

            /// call helper function to store new image and return  path new image and delete old images
            $data['image'] = storeImage($request->file('image'), 'sliders', $slider->image);
        }

        $slider->update($data);

        return redirect()->back()->with('status', __('cp.update'));

    }


    public function destroy(Slider $slider    )
    {

        $slider->delete();
        return response()->json(['status' => true, 'message' => 'success']);


    }




}
