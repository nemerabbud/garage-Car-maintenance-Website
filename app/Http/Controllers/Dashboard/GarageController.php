<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\CarTypeRequest;
use App\Http\Requests\CategoryRequest;
use App\Http\Requests\GarageRequest;
use App\Http\Requests\PlanRequest;
use App\Http\Requests\UserRequest;
use App\Models\CarType;
use App\Models\Category;
use App\Models\Garage;
use App\Models\Language;
use App\Models\Order;
use App\Models\Plan;
use App\Models\Service;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class GarageController extends SupperController
{

    public function __construct()
    {
        parent::__construct();
        $this->route = "garage";
        $this->path = "admin.garage";

    }


    public function index(Request $request)
    {
        $items = Garage::with('plan', 'user')->latest();
        $plans = Plan::latest()->get();

        if (\request()->has('mobile') && !empty($request->mobile))

            $items->whereHas('user', function ($user) use ($request) {

                $user->where('mobile', $request->mobile);

            });

        if (\request()->has('statusUser') && !empty($request->statusUser))
            $items->where('status', $request->statusUser);

        if (\request()->has('plan_id') && !empty($request->plan_id))
            $items->where('plan_id', $request->plan_id);

        $items = $items->paginate(10);

        return view("{$this->path}.home", ['items' => $items, 'plans' => $plans]);
    }


    public function create()
    {
        $categories = Category::with('services')->get();
        $plans = Plan::all();
        $carTypes = CarType::all();
        $services = Service::all();
        return view("{$this->path}.create", compact('categories', 'plans', 'carTypes', 'services'));
    }


    public function store(Request $request)
    {


        $locales = Language::all()->pluck('lang');
        $roles = [
            ////start user info
            'name' => 'required|string',
            'email' => 'required|string|email|max:191|unique:users',
            'mobile' => 'required|string',
            'image' => 'nullable|image|mimes:jpeg,jpg,png,gif',
            'is_special' => 'nullable|numeric',
            'password' => 'required|string|min:6',
            /// end user valid
            ////start garage info
            'lat' => 'required',
            'lng' => 'required',

            'category_id' => 'required|numeric|exists:categories,id',

            'plan_id' => 'required|numeric|exists:plans,id',
            'update_plan' => 'nullable',


            // services validation

            'services' => 'required|array',
            'services.*' => 'required|numeric|exists:services,id',

            // end services validation

            // start car_types validation

            'carTypes' => 'required|array',
            'carTypes.*' => 'required|numeric|exists:car_types,id',

            // end car_types validation

            'images' => 'required|array',
            'images.*' => 'required|image|mimes:jpeg,jpg,png,gif',
        ];
        /// multi lang data

        foreach ($locales as $locale) {
            $roles[$locale] = 'required|array';
            $roles["$locale.description"] = 'required|string';
            $roles["$locale.address"] = 'required|string';
            $roles["$locale.name"] = 'required|string';
        }


        $data = $this->validate($request, $roles);

        try {
            DB::beginTransaction();


            $user_data = $request->only('name',
                'email',
                'mobile',
                'image',
                'password');
            if ($request->hasFile('image')) {
                $user_data['image'] = storeImage($request->file('image'), 'users');
            }
            $images = [];

            if ($request->hasFile('images') && count($request->images) > 0) {

                foreach ($request->file('images') as $img)
                    $images[]['image'] = storeImage($img, 'garages');
            }

            $user_data['role'] = 'garage';

            $user = User::create($user_data);

            $plan = Plan::find($request->plan_id);
            $garage_data = $request->only('lat', 'lng', 'category_id', 'en', 'ar');
            $garage_data['plan_id'] = $plan->id;
            $garage_data['amount'] = $plan->price;
            $garage_data['start_date'] = now();
            $garage_data['end_date'] = Carbon::parse(now())->addDays($plan->duration);

            $garage_data['is_special'] = $request->has('is_special');

            $garage = $user->garage()->create($garage_data);/// create  garage to user ;

            $garage->services()->sync($request->services); // add services to garage

            $garage->carTypes()->sync($request->carTypes);        // add  car types to garage

            if ($images && count($images) > 0)
                $garage->images()->createMany($images);        // add  images to garage
//            $garage->saveImages($request->images);        // add  images to garage

            DB::commit();

            return redirect()->back()->with('status', __('cp.create'));
        } catch (\Exception $exception) {
            DB::rollBack();
            return redirect()->back()->with('errors', __('cp.errors'));

        }

    }

    public function show($id)
    {
        //
    }


    public function edit(Garage $garage)
    {

        $garage->load('user', 'images', 'services');
        $categories = Category::with('services')->get();
        $plans = Plan::all();
        $carTypes = CarType::all();
        $services = Service::where('category_id', $garage->category_id)->get();
        return view("{$this->path}.edit", compact('garage', 'categories', 'plans', 'carTypes', 'services'));
    }


    public function update(Request $request, Garage $garage)
    {
        $locales = Language::all()->pluck('lang');
        $roles = [
            ////start user info
            'name' => 'required|string',
            'email' => 'required|string|email|max:191|unique:users,email,' . $garage->user_id,
            'mobile' => 'required|string',
            'image' => 'nullable|image|mimes:jpeg,jpg,png,gif',


            'lat' => 'required',
            'lng' => 'required',

            'category_id' => 'required|numeric|exists:categories,id',

            'plan_id' => 'required|numeric|exists:plans,id',
            'update_plan' => 'nullable',


            // services validation

            'services' => 'required|array',
            'services.*' => 'required|numeric|exists:services,id',

            // end services validation

            // start car_types validation

            'carTypes' => 'required|array',
            'carTypes.*' => 'required|numeric|exists:car_types,id',

            // end car_types validation

            'images' => 'nullable|array',
            'images.*' => 'required|image|mimes:jpeg,jpg,png,gif',


            'oldImages' => 'nullable|array', // image that remain to garage
            'oldImages.*' => 'required|numeric|exists:garage_images,id',

        ];
        /// multi lang data

        foreach ($locales as $locale) {
            $roles[$locale] = 'required|array';
            $roles["$locale.description"] = 'required|string';
            $roles["$locale.address"] = 'required|string';
            $roles["$locale.name"] = 'required|string';

        }


        $data = $this->validate($request, $roles);

        try {


            DB::beginTransaction();
            $user_data = $request->only('name',
                'email',
                'mobile',
                'image');

            if ($request->hasFile('image')) {
                /// update image and delete old image
                $user_data['image'] = storeImage($request->file('image'), 'users', $garage->user->image);
            }
            $images = [];

            if ($request->hasFile('images') && count($request->images) > 0) {

                foreach ($request->file('images') as $img)
                    $images[]['image'] = storeImage($img, 'garages');
            }


            $garage->user()->update($user_data);

            $garage_data = $request->only('lat', 'lng', 'category_id', 'en', 'ar');
            $garage_data['is_special'] = $request->has('is_special');

            if ($garage->plan_id !== $request->plan_id || $request->has('update_plan')) {
                $plan = Plan::find($request->plan_id);
                $garage_data['plan_id'] = $plan->id;
                $garage_data['start_date'] = now();
                $garage_data['amount'] = $plan->price;
                $garage_data['status'] = 'active';
                $garage_data['end_date'] = Carbon::parse(now())->addDays($plan->duration);
            }

            $garage->update($garage_data);/// update  garage data ;

            $garage->services()->sync($request->services); //remove old services that not in services array and add new service
            $garage->carTypes()->sync($request->carTypes);        //remove old car types that not in car types array and add new car type


            /// delete deleted images
            $garage->images()->whereNotIn('id', $request->oldImages)->delete();

            if ($images && count($images) > 0)
                $garage->images()->createMany($images);        // add  images to garage


            DB::commit();

            return redirect()->back()->with('status', __('cp.update'));
        } catch (\Exception $exception) {
            DB::rollBack();
            return redirect()->back()->with('errors', __('cp.errors'));

        }


    }


    public function destroy(Garage $garage)
    {

        $garage->user->delete();
        $garage->delete();

        return response()->json(['status' => true, 'message' => 'success']);


    }


    function edit_password(User $user)
    {

        return view("{$this->path}.edit_password", ['item' => $user]);
    }


    function getOrders($garage_id)
    {

        $items = Order::with('user', 'garage.user')->where('garage_id', $garage_id)->paginate(10);

        return view("{$this->path}.orders", compact('items'));


    }


}
