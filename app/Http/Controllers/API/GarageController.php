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
use App\Models\Finance;
use App\Models\Garage;
use App\Models\GarageReview;
use App\Models\Order;
use App\Models\Plan;
use App\Models\Service;
use Illuminate\Http\Request;

class GarageController extends SupperController
{
    public function __construct()
    {

        parent::__construct();
    }

    public function get_orders()
    {

        $orders = Order::where('garage_id', auth()->user()->garage->id);
        if (\request()->has('status'))
            $orders = $orders->status(\request()->get('status'));


        return response()->json(['status' => true, 'code' => 200, 'message' => __('api.ok'), 'orders' => $this->formatPaginationData($orders, OrderResource::collection($orders))]);


    }


    public function get_garage_to_services(Request $request)
    {



        $latitude = \request()->lat;
        $longitude = \request()->lng;
        $garages = Garage::active()->with('user')
                     ->select(\DB::raw("*,( 6371 * acos( cos( radians($latitude) ) * cos( radians( lat ) ) * cos( radians(lng) - radians($longitude)) + sin(radians($latitude)) * sin( radians(lat)))) AS distance"));


        if (\request()->has('category_id'))
            $garages = $garages->where('category_id', \request()->category_id);

        if (\request()->has('search') && !empty(\request()->search) )
            $garages = $garages->whereTranslationLike('name',"%".\request()->search.'%');



        if (\request()->has('services_ids')&& is_array(\request()->services_ids))
            $garages = $garages->whereHas('services', function ($query) {
                $query->whereIn('id', \request()->services_ids);
            });



        if (\request()->has('nearest') && \request()->nearest)
            $garages = $garages->orderBy('distance');
        $garages = $garages->paginate(30);

        $message = __('api.ok');
        return response()->json(['status' => true, 'code' => 200, 'message' => $message, 'garages' => $this->formatPaginationData($garages, GarageResource::collection($garages))]);


    }

    public function get_all_garages()
    {

        $latitude = \request()->lat;
        $longitude = \request()->lng;
        $garages = Garage::active()->with('user')
            ->select(\DB::raw("*,( 6371 * acos( cos( radians($latitude) ) * cos( radians( lat ) ) * cos( radians(lng) - radians($longitude)) + sin(radians($latitude)) * sin( radians(lat)))) AS distance"));

        if (\request()->has('category_id'))
            $garages = $garages->where('category_id', \request()->category_id);

        if (\request()->has('service_id'))
            $garages = $garages->whereHas('services', function ($query) {
                $query->where('id', \request()->service_id);
            });

        if (\request()->has('search') && !empty(\request()->search) )
            $garages = $garages->whereTranslationLike('name',"%".\request()->search.'%');




        if (\request()->has('nearest') && \request()->nearest)
            $garages = $garages->orderBy('distance');


        $garages = $garages->paginate(30);

        $message = __('api.ok');
        return response()->json(['status' => true, 'code' => 200, 'message' => $message, 'garages' => $this->formatPaginationData($garages, GarageResource::collection($garages))]);


    }

    public function get_garage_info($garage_id)
    {

      
        $latitude = \request()->lat ?? 0;
        $longitude = \request()->lng ?? 0;
        $garage = Garage::active()->with(['user', 'images', 'services', 'category', 'carTypes'])
            ->select(\DB::raw("*,( 6371 * acos( cos( radians($latitude) ) * cos( radians( lat ) ) * cos( radians(lng) - radians($longitude)) + sin(radians($latitude)) * sin( radians(lat)))) AS distance"))
            ->find($garage_id);

        if ($garage) {

            $message = __('api.ok');
            return response()->json(['status' => true, 'code' => 200, 'message' => $message, 'garage' => new  GarageInfoResource($garage)]);
        } 
            $message = __('api.not_found');


        return response()->json(['status' => false, 'code' => 404, 'message' => $message]);


    }
    public function get_garage_reviews($garage_id)
    {
        $reviews = GarageReview::with('user')->where('garage_id',$garage_id)->latest()->paginate(30);
            $message = __('api.ok');
            return response()->json(['status' => true, 'code' => 200, 'message' => $message, 'reviews' => ReviewResource::collection($reviews), 'nextPageUrl'=>$reviews->nextPageUrl() ]);
    }


    public function create_review(Request $request)
    {

        $response = $this->custom_validation($request->all(), GarageReview::ReviewValidation);
        if ($response !== true)
            return $response;


        $review = auth()->user()->reviews()->create($request->only('garage_id', 'rate', 'content','order_id'));

        /// change order status to be is reviewed
        Order::where([['id',$request->order_id],['user_id',auth()->id()]])->update(['is_reviewed'=>true]);
        $message = __('api.ok');
        return response()->json(['status' => true, 'code' => 200, 'message' => $message, 'review' => new ReviewResource($review)]);


    }


    public function get_user_garage_info()
    {

        $garage = Garage::with(['user', 'images', 'services', 'category', 'carTypes', 'plan'])->where('user_id', auth()->id())->first();

        if ($garage) {

            $message = __('api.ok');

            return response()->json(['status' => true, 'code' => 200, 'message' => $message, 'garage' => new  UserGarageResource($garage)]);

        } else
            $message = __('api.not_found');


        return response()->json(['status' => false, 'code' => 404, 'message' => $message]);


    }

    public function active_garage(Plan $plan)
    {

        $user  = auth('api')->user();

        $finance =  Finance::create([
            'user_id'=>$user->id,
            'garage_id'=>$user->garage->id,
            'plan_id'=>$plan->id,
            'amount'=>$plan->price,
        ]);

        $payment_link = route('api_payment_page', $finance->id);
        return response()->json(['status' => true, 'code' => 200,'payment_link'=>$payment_link, 'message' => __('api.ok')]);


    }

}
