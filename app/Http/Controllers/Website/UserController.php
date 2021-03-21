<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\ContactUs;
use App\Models\Finance;
use App\Models\Garage;
use App\Models\Plan;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{

//
//    public function __construct()
//    {
////        $this->path = "website.users";
//    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function update_garage_profile(Request $request){
        if ($request->ajax()) {
        $rules = [
            'name' => 'required|string',
            'mobile' => 'required|string',
            'email' => "required|string|email|unique:users,email,".auth()->id(),
            'image' => 'nullable|image',
            'category_id' => 'required|numeric|exists:categories,id',
            'ar' => 'required|array',
            'ar.name' => 'required|string',
            'ar.address' => 'required|string',
            'ar.description' => 'required|string',
            'en' => 'required|array',
            'en.name' => 'required|string',
            'en.address' => 'required|string',
            'en.description' => 'required|string',

            'services' => 'required|array',
            'services.*' => 'required|numeric|exists:services,id',

            'car_types' => 'required|array',
            'car_types.*' => 'required|numeric|exists:car_types,id',
            'images' => 'nullable|array',
            'images.*' => 'required|image',
//            'deleted_images' => 'nullable|array',
//            'deleted_images.*' => 'required|numeric|exists:garage_images,id',
        ];
            $validate = Validator::make($request->all(), $rules);
            if ($validate->fails()) {
                return response([
                    'status' => false,
                    'code' => 400,
                    'message' => implode('\r\n', $validate->errors()->all())
                ], 400);
            }
            $data = $request->only('name', 'mobile','email');


            // update  user info
            $user = Auth::user();


            if ($request->hasFile('image'))
                $data['image'] =  storeImage($request->file('image'),'users', $user->image);



            $user->update($data);

            // update  garage info
            $garage = $user->garage;
            /// update  garage  info
            $garage->update($request->only('category_id', 'ar', 'en'));


            /// update services
            $garage->services()->sync($request->services);

//            $garage->carTypes()->sync($request->car_types);

//            if ($request->has('deleted_images') && count($request->deleted_images) > 0) { // if request has new images
//                $garage->images()->whereIn('id', $request->deleted_images)->delete();
//
//            }

            if ($request->has('images') && count($request->images) > 0) { // if request has new images
                $images_insert = [];
                foreach ($request->images as $img) {
                    $images_insert[]['image'] =  storeImage($img,'garages');//$img;
                }
                $garage->images()->createMany($images_insert);

            }

            $message = __('website.ok');
            return response()->json(['status' => true, 'code' => 200, 'message' => $message, 'user' => $user]);
        }
    }

    public function changePassword(Request $request)
    {
        if ($request->ajax()) {

            $rules = [
                'old_password' => 'required|min:6',
                'password' => 'required|min:6',
                'confirm_password' => 'required|min:6|same:password',
            ];


            $validate = Validator::make($request->all(), $rules);
            if ($validate->fails()) {

                return response([
                    'status' => false,
                    'code' => 400,
                    'message' => implode('\r\n', $validate->errors()->all())
                ], 400);
            }


            $user = Auth::user();

            if (!Hash::check($request->get('old_password'), $user->password)) {
                $message = __('website.wrongOldPassword'); //wrong old
                return response()->json(['status' => false, 'code' => 400, 'message' => $message], 400);
            }


            $user->update(['password' => $request->password]);
            $message = __('website.editsuccess');
            return response()->json(['status' => true, 'code' => 200, 'message' => $message]);

        }
    }

    public function update_user_profile(Request $request)
    {

        if ($request->ajax()) {
            $rules = [
                'email' => "required|string|email|unique:users,email,".auth()->id(),
                'name' => 'required|string',
                'mobile' => 'required|string',
                'image' => 'nullable|image',
            ];

            $validate = Validator::make($request->all(), $rules);
            if ($validate->fails()) {
                return response([
                    'status' => false,
                    'code' => 400,
                    'message' => implode('\r\n', $validate->errors()->all())
                ], 400);
            }

            $user = Auth::user();
            $data = $request->only('name', 'mobile','email');

            if ($request->hasFile('image'))
                $data['image'] = storeImage($request->file('image'), 'users', $user->image);


            $user->update($data);


            $message = __('website.ok');
            return response()->json(['status' => true, 'code' => 200, 'message' => $message, 'user' => $user]);
        }
    }


    public  function  active_garage(Request $request){

        $user = Auth::user();

        if ($user->garage->status === 'active')
            abort(403);

            $plan = Plan::active()->findOrFail($request->plan_id);

        $finance =  Finance::create([
            'user_id'=>$user->id,
            'garage_id'=>$user->garage->id,
            'plan_id'=>$plan->id,
            'amount'=>$plan->price,
        ]);

        return redirect()->route('payment_page', $finance->id);

    }
}
