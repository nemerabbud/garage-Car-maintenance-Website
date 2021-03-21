<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\Ads as AdsResource;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\GarageInfoResource;
use App\Http\Resources\NotificationsResource;
use App\Http\Resources\ServiceResource;
use App\Http\Resources\UserGarageResource;
use App\Http\Resources\UserResource;
use App\Models\Category;
use App\Models\Notify;
use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends SupperController
{
    public function __construct()
    {

        parent::__construct();
    }

    public function get_notification()
    {

        $user = Auth::user();

        $notifies = Notify::where('user_id', $user->id)->latest()->get();
        if (count($notifies) > 0)

            return response()->json(['status' => true, 'code' => 200, 'message' => __('api.ok'), 'notification' => $notifies]);
        else
            return response()->json(['status' => true, 'code' => 200, 'message' => __('api.not_found_notification'), 'notification' => []]);


    }


    public function changePassword(Request $request)
    {
        $rules = [
            'old_password' => 'required|min:6',
            'password' => 'required|min:6',
            'confirm_password' => 'required|min:6|same:password',
        ];

        $response = $this->custom_validation($request->all(), $rules);
        if ($response !== true) // if validation fail
            return $response;


        $user = Auth::user();

        if (!Hash::check($request->get('old_password'), $user->password)) {
            $message = __('api.old_password'); //wrong old
            return response()->json(['status' => false, 'code' => 400, 'message' => $message]);
        }

        $user->password = $request->get('password'); // it 's bcrypt in user model by set Password


        if ($user->save()) {
            $user->refresh();
            $message = __('api.ok');
            return response()->json(['status' => true, 'code' => 200, 'message' => $message]);
        }
        $message = __('api.whoops');
        return response()->json(['status' => false, 'code' => 400, 'message' => $message]);
    }


    public function update_user_profile(Request $request)
    {
        $user = Auth::user();

        $rules = [
            'name' => 'required|string',
            'mobile' => 'required|string',
            'image' => 'nullable|image',
            'email' => 'required|string|email|max:191|unique:users,email,'.$user->id,

        ];

        $response = $this->custom_validation($request->all(), $rules);
        if ($response !== true) // if validation fail
            return $response;

        $data = $request->only('name', 'mobile' ,'email');

        if ($request->hasFile('image'))
            $data['image'] = storeImage($request->file('image'),'users', $user->image);



        $user->update($data);



        $message = __('api.ok');
        return response()->json(['status' => true, 'code' => 200, 'message' => $message, 'user' => (new UserResource(\auth()->user()))]);

    }

    public function update_garage_profile(Request $request)
    {

        // update  user info
        $user = Auth::user();
        $rules = [
            'name' => 'required|string',
            'mobile' => 'required|string',
            'image' => 'nullable|image',
            'email' => 'required|string|email|max:191|unique:users,email,'.$user->id,
            'category_id' => 'required|numeric|exists:categories,id',
            'ar' => 'required|array',
            'ar.name' => 'required|string',
            'ar.address' => 'required|string',
            'ar.description' => 'required|string',
            'en' => 'nullable|array|min:3',
            'en.*' => 'required|string',
            'services' => 'required|array',
            'services.*' => 'required|numeric|exists:services,id',
            'car_types' => 'required|array',
            'car_types.*' => 'required|numeric|exists:car_types,id',
            'images' => 'nullable|array',
            'images.*' => 'required|image',
            'deleted_images' => 'nullable|array',
            'deleted_images.*' => 'required|numeric|exists:garage_images,id',
        ];

        $response = $this->custom_validation($request->all(), $rules);
        if ($response !== true) // if validation fail
            return $response;
        $data = $request->only('name', 'mobile' ,'email');





        if ($request->hasFile('image'))
            $data['image'] =  storeImage($request->file('image'),'users', $user->image);



        $user->update($data);

        // update  garage info
        $garage = $user->garage;
        /// update  garage  info
        $garage->update($request->only('category_id', 'ar', 'en'));


        /// update services
        $garage->services()->sync($request->services);

        $garage->carTypes()->sync($request->car_types);

        if ($request->has('deleted_images') && count($request->deleted_images) > 0) { // if request has new images
            $garage->images()->whereIn('id', $request->deleted_images)->delete();

        }

        if ($request->has('images') && count($request->images) > 0) { // if request has new images
            $images_insert = [];
            foreach ($request->images as $img) {
                $images_insert[]['image'] =  storeImage($img,'garages');//$img;
            }
            $garage->images()->createMany($images_insert);

        }


//        $garage->refresh();
        $message = __('api.ok');
        return response()->json(['status' => true, 'code' => 200, 'message' => $message, 'garage' => new UserGarageResource($garage)]);
//        return response()->json(['status' => true, 'code' => 200, 'message' => $message, 'user' => )]);

    }


    public function get_user_info(Request $request)
    {
        $message = __('api.ok');
        return response()->json(['status' => true, 'code' => 200, 'message' => $message, 'user' => (new UserResource(\auth()->user()))]);

    }


}
