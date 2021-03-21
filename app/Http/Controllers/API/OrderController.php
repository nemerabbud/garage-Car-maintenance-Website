<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\Ads as AdsResource;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\OrderInfoResource;
use App\Http\Resources\OrderResource;
use App\Http\Resources\ServiceResource;
use App\Models\Category;
use App\Models\Garage;
use App\Models\Language;
use App\Models\Notify;
use App\Models\Order;
use App\Models\Service;
use App\Models\Token;
use App\Notifications\OrderNotification;
use Illuminate\Http\Request;

class OrderController extends SupperController
{
    public function __construct()
    {

        parent::__construct();
    }

    public function create_order(Request $request)
    {
        $response = $this->custom_validation($request->all(), [
            'garage_id' => 'required|numeric|exists:garages,id',
            'date' => 'required|string',
            'time' => 'required|string',
            'description' => 'required|string',
            'services' => 'required|array',
            'services.*' => 'required|exists:services,id',
            'images' => 'required|array',
            'images.*' => 'required|image',

        ]);
        if ($response !== true)
            return $response;


        $data = $request->only('garage_id', 'date', 'time', 'description');
        $data['user_id'] = auth()->id();
          $images = [];
        foreach ($request->images as $img)
            $images[]['image'] = storeImage($img, 'orders');
        $order = Order::create($data);
        $order->services()->sync($request->services);
//
        if (count($images) > 0)
            $order->images()->createMany($images);


        /// start send     Notification
        $garage = Garage::with('user')->find($request->garage_id);

        $garage_user = $garage->user;

        $messages = [
            'ar' => [
                'message' => "  طلب  جديد #{$order->id} ",
                'title' => config('app.name'),
            ],
            'en' => [
                'message' => "There is a new order #{$order->id}",
                'title' => config('app.name'),
            ],
        ];

        $notify = $messages ;
        $notify['user_id'] = $garage_user->id;
        $notify['order_id'] = $order->id;
        Notify::create($notify);

        $tokens = Token::acceptNotification()->where('user_id', $garage_user->id)->get(); // fetch user tokens

        /// helper function to send many notification according to device language
        sendNotificationsToManyLanguageDevices($tokens, $messages, 2,$order->id);


        // end send notification
        $message = __('api.ok');

        return response()->json(['status' => true, 'code' => 200, 'message' => $message, 'order' => new OrderInfoResource($order)]);


    }

    public function get_orders()
    {


        if (auth()->user()->role == 'garage')
            $orders = Order::with('user')->where('garage_id', auth()->user()->garage->id);
        else
            $orders = Order::with('garage')->where('user_id', auth()->id());

        if (\request()->has('status'))
            $orders = $orders->status(\request()->get('status'));


        ///  filter  get order  in specific services
        if (\request()->has('services') && is_array(\request()->services))
            $orders = $orders->whereHas('services', function ($query) {
                $query->whereIn('id', \request()->services);
            });

        ///  filter  get order  in specific data
        if (\request()->has('date'))
            $orders = $orders->whereDate('date', request()->date);


        $orders = $orders->orderBy('id','DESC')->paginate(30);


//        if (count($categories) > 0)
        $message = __('api.ok');
//         else
//            $message = __('api.not_found');

        return response()->json(['status' => true, 'code' => 200, 'message' => $message, 'orders' => $this->formatPaginationData($orders, OrderResource::collection($orders))]);


    }

    public function get_order_info($order_id)
    {

        if (auth()->user()->role == 'garage')
            $order = Order::with(['services', 'user','images'])
                ->where('id', $order_id)
                ->where('garage_id', auth()->user()->garage->id)
                ->first();
        else
            $order = Order::with(['services',
                'garage', 'garage.user', 'garage.category',
                'garage.images', 'garage.services', 'garage.carTypes'
            ])
                ->where('id', $order_id)
                ->where('user_id', auth()->id())
                ->first();

        $data = null;
        if ($order) {
            $message = __('api.ok');
            $data = new  OrderInfoResource($order);
        } else
            $message = __('api.not_found');

        return response()->json(['status' => true, 'code' => 200, 'message' => $message, 'orders' => $data]);


    }

    public function accept_order($order_id)
    {

        $order = Order::with(['services', 'user'])
            ->where('status','waiting')
            ->where('id', $order_id)
            ->where('garage_id', auth()->user()->garage->id)
            ->first();

        $data = null;
        if ($order) {
            $order->update(['status' => 'accepted']);



            /// start send notify
            $messages = [
                'ar' => [
                    'message' => " تم قبول طلب رقم #{$order->id}",
                    'title' =>config('app.name'),
                ],
                'en' => [
                    'message' => "Your order #{$order->id} has been accepted",
                    'title' => config('app.name'),
                ],
            ];

            $user_order = $order->user;
            $notify = $messages ;
            $notify['user_id'] = $user_order->id;
            $notify['order_id'] = $order->id;
            Notify::create($notify);

            $tokens = Token::acceptNotification()->where('user_id', $user_order->id)->get(); // fetch user tokens

            /// helper function to send many notification according to device language
            sendNotificationsToManyLanguageDevices($tokens, $messages, 2,$order->id); // order notification

            /// end send notify

            $data = new  OrderInfoResource($order);
            $message = __('api.accept_order');
            return response()->json(['status' => true, 'code' => 200, 'message' => $message]);

        } else
            $message = __('api.not_found');

        return response()->json(['status' => false, 'code' => 200, 'message' => $message]);


    }


    public function reject_order($order_id)
    {

        $order = Order::with('user')->where('status','waiting')
            ->where('id', $order_id)
            ->where('garage_id', auth()->user()->garage->id)
            ->first();

        $data = null;
        if ($order) {
            $message = __('api.reject_order');


            $data = ['status' => 'rejected'];
            if (\request()->has('rejected_message')) {
                $data['rejected_message'] = \request()->rejected_message;
            }
            $order->update($data);
            /// start send notify
            $messages = [
                'ar' => [
                    'message' => " تم رفض طلب رقم #{$order->id}",
                    'title' => config('app.name'),
                ],
                'en' => [
                    'message' => "Your order #{$order->id} has been rejected",
                    'title' => config('app.name'),
                ],
            ];

            $user_order = $order->user;
            $notify = $messages ;
            $notify['user_id'] = $user_order->id;
            $notify['order_id'] = $order->id;
            Notify::create($notify);

            $tokens = Token::acceptNotification()->where('user_id', $user_order->id)->get(); // fetch user tokens

            /// helper function to send many notification according to device language
            sendNotificationsToManyLanguageDevices($tokens, $messages, 2,$order->id); // order notification

            /// end send notify


            return response()->json(['status' => true, 'code' => 200, 'message' => $message]);

        } else
            $message = __('api.not_found');

        return response()->json(['status' => false, 'code' => 400, 'message' => $message]);


    }

}
