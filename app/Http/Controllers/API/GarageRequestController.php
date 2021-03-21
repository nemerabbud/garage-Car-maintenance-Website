<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\Ads as AdsResource;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\GarageInfoResource;
use App\Http\Resources\GarageResource;
use App\Http\Resources\OrderInfoResource;
use App\Http\Resources\OrderResource;
use App\Http\Resources\ReviewResource;
use App\Http\Resources\ServiceResource;
use App\Http\Resources\UserGarageResource;
use App\Models\Category;
use App\Models\Garage;
use App\Models\GarageRequest;
use App\Models\GarageReview;
use App\Models\Language;
use App\Models\Order;
use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class GarageRequestController extends SupperController
{
    public function __construct()
    {

        parent::__construct();
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


        $validate = Validator::make($request->all(), $roles);
        if ($validate->fails()) {

            return response([
                'status' => false,
                'code' => 400,
                'message' => implode('\n', $validate->errors()->all())
            ]);
        }

        $data = $validate->validated();
        $data['logo'] = storeImage($request->file('logo'),'garages');
        $data['commercial_license_image'] = storeImage($request->file('commercial_license_image'),'commercial_license_image');

        GarageRequest::create($data);

        $message =  __('website.success_create_request_garage');
        return response()->json(['status' => true, 'code' => 200, 'message' => $message]);


    }


}
