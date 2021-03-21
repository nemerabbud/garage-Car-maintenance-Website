<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Garage;
use App\Models\GarageRequest;
use App\Models\Language;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Validator;

class GarageRequestController extends Controller
{


    public function __construct()
    {
        $this->path = "website.garages";
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function showGarageRequestForm()
    {
        return view("{$this->path}.create_garage_request");
    }

    public function create_garage_request(Request $request)
    {
        $locales = Language::all()->pluck('lang');
        $roles = [
            ////start user info
            'owner_name' => 'required|string',
            'email' => 'required|string|email|max:191|unique:users',///to prevent duplicate email in user table
            'mobile' => 'required|string',
            'logo' => 'required|image|mimes:jpeg,jpg,png,gif',
            'commercial_license_image' => 'required|image|mimes:jpeg,jpg,png,gif',
//            'image' => 'nullable|image|mimes:jpeg,jpg,png,gif',

            'lat' => 'required',
            'lng' => 'required',

        ];
        /// multi lang data

        foreach ($locales as $locale) {
            $roles[$locale] = 'required|array';
            $roles["$locale.description"] = 'required|string';
            $roles["$locale.address"] = 'required|string';
            $roles["$locale.title"] = 'required|string';
        }


        $data = $this->validate($request, $roles);


        $data['logo'] = storeImage($request->file('logo'), 'garages');
        $data['commercial_license_image'] = storeImage($request->file('commercial_license_image'), 'commercial_license_image');

        GarageRequest::create($data);

        return back()->with('success', __('website.success_create_request_garage'));


    }


}
