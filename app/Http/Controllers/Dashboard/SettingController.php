<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\CarTypeRequest;
use App\Http\Requests\CategoryRequest;
use App\Http\Requests\PlanRequest;
use App\Http\Requests\UserRequest;
use App\Models\CarType;
use App\Models\Category;
use App\Models\ContactUs;
use App\Models\Language;
use App\Models\Plan;
use App\Models\Setting;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Storage;

class SettingController extends SupperController
{

    public function __construct()
    {
        parent::__construct();
        $this->route = "settings";
        $this->path = "admin.settings";

    }


    public function index()
    {
        return view("$this->path.edit");
    }


    public function create()
    {
//        return view();
    }


    public function store(Request $request)
    {


        $locales = Language::all()->pluck('lang');
        $roles = [
            'instagram' => 'nullable|url',
            'facebook' => 'nullable|url',
            'twitter' => 'nullable|url',
            'app_store_url' => 'nullable|url',
            'play_store_url' => 'nullable|url',
            'mobile' => 'nullable|numeric',
            'rate_number' => 'nullable|numeric',
            'logo' => 'nullable|image',
            'favicon' => 'nullable|image',
            'image' => 'nullable|image',


        ];

        foreach ($locales as $locale) {
            $roles["$locale.title"] = 'nullable|string';
            $roles["$locale.description"] = 'nullable|string';
            $roles["$locale.download_app_text"] = 'nullable|string';
            $roles["$locale.address"] = 'nullable|string';

        }

        $data = $this->validate($request , $roles);

        if ($request->hasFile('logo'))
            $data['logo'] = storeImage($request->file('logo'), 'settings');
        if ($request->hasFile('favicon'))
            $data['favicon'] = storeImage($request->file('favicon'), 'settings');
      if ($request->hasFile('image'))
            $data['image'] = storeImage($request->file('image'), 'settings');


        $setting = Setting::first();
        $setting->update($data);



        Cache::pull('settings');

        return redirect()->back()->with('status', trans('cp.edit'));


    }


    public function show(ContactUs $contactUs)
    {
        //
    }


    public function edit($id)
    {

    }


    public function update(Request $request, $id)
    {
        //
    }


    public function destroy(ContactUs $contactUs)
    {

        //


    }
}
