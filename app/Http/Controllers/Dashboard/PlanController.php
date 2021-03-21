<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\PlanRequest;
use App\Models\Language;
use App\Models\Plan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;

class PlanController extends SupperController
{

    public function __construct()
    {
        parent::__construct();
        $this->route = "plans";
        $this->path = "admin.plans";
    }


    public function index()
    {
        $plans = Plan::all();
        return view("{$this->path}.home", compact('plans'));
    }


    public function create()
    {
        return view("{$this->path}.create");
    }


    public function store(Request $request)
    {
        $locales = Language::all()->pluck('lang');

        $roles = [

            'price' => 'required|numeric',
            'duration' => 'required|numeric',


        ];
        foreach ($locales as $locale) {
            $roles[$locale] = 'required|array';
            $roles["$locale.title"] = 'required|string';
            $roles["$locale.description"] = 'required|string';
        }
        $data = $this->validate($request, $roles);

        Plan::create($data);


        return redirect()->back()->with('status', __('cp.create'));
    }


    public function show($id)
    {
        //
    }

    public function edit(Plan $plan)
    {

        return view("{$this->path}.edit", ['item' => $plan]);
    }


    public function update(Request $request, Plan $plan)
    {

        $locales = Language::get()->pluck('lang');

        $roles = [

            'price' => 'required|numeric',
            'duration' => 'required|numeric',


        ];
        foreach ($locales as $locale) {
            $roles[$locale] = 'required|array';
            $roles["$locale.title"] = 'required|string';
            $roles["$locale.description"] = 'required|string';
        }
        $data = $this->validate($request, $roles);


        $plan->update($data);

        return redirect()->back()->with('status', __('cp.update'));

    }


    public function destroy(Plan $plan)
    {

        $plan->delete();
        return response()->json(['status' => true, 'message' => 'success']);


    }
}
