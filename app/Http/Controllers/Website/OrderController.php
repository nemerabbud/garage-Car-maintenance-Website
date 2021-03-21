<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use App\Http\Resources\OrderInfoResource;
use App\Models\Category;
use App\Models\Garage;
use App\Models\GarageReview;
use App\Models\Notify;
use App\Models\Order;
use App\Models\Token;
use App\Notifications\OrderNotification;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Cache;

class OrderController extends Controller
{


    public function __construct()
    {
        $this->path = "website.orders";
    }

    public function my_orders(Request $request)
    {


        $orders = Order::with('services', 'user', 'garage','images');
        if (auth()->user()->role == 'garage'){
            $orders->where('garage_id',auth()->user()->garage->id);
        }else{
            $orders->where('user_id',auth()->id());

        }
        $orders = $orders->latest()->paginate(3);



        if ($request->ajax()){
            $orders_render = view('website.components.orders',compact('orders'))->render();
            $orders_modal_render = view('website.components.orders_modal',compact('orders'))->render();

            return  response(['status'=>true,'orders'=>$orders_render , 'orders_modal'=>$orders_modal_render , 'next_page_url'=>$orders->nextPageUrl()]);
        }

        return view("{$this->path}.my_orders", compact('orders'));
    }

    public function create_order_form(Garage $garage, $garage_name)
    {
        return view("{$this->path}.new_order", compact('garage'));
    }


    public function create_order(Request $request, Garage $garage, $garage_name)
    {


        $response= $this->validate($request,[
            'date' => 'required|string',
            'time' => 'required|string',
            'description' => 'required|string',
            'services_ids' => 'required|array',
            'services_ids.*' => 'required|exists:services,id',
            'images' => 'required|array',
            'images.*' => 'required|image',
        ]);


          $images = [];
        foreach ($request->images as $img)
            $images[]['image'] = storeImage($img, 'orders');

        $response['garage_id']=$garage->id;
        $response['user_id']=auth()->id();
        $order =Order::create(Arr::except($response,['services_ids','images']));

        if (count($response['services_ids'])>0)
        $order->services()->attach($response['services_ids']);

        if (count($images) > 0)
            $order->images()->createMany($images);



        /// start send     Notification


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



        return redirect(route('website.my_orders'))->with('success',trans('website.ok'));
    }

    public function order_rate(Request $request){

        $response= $this->validate($request,[
            'order_id' => 'required|numeric|exists:orders,id',
            'garage_id' => 'required|numeric|exists:garages,id',
            'rating3' => 'required|numeric',
            'content' => 'required|string',

        ]);


        $response['user_id'] = auth()->id();
        $response['rate'] = $response['rating3'];
        GarageReview::create(Arr::except($response,'rating3'));

        Order::find($request->order_id)->update(['is_reviewed'=>true]);


        return redirect(route('website.my_orders'))->with('success',trans('website.ok'));
    }



    public function accept_order($order_id)
    {

        $order = Order::with('user')->where('status','waiting')
            ->where('id', $order_id)
            ->where('garage_id', auth()->user()->garage->id)
            ->firstOrFail();

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
            return  back()->with('success',__('website.accept_order'));


    }


    public function reject_order($order_id)
    {



        $order = Order::with('user')
            ->where('status','waiting')
            ->where('id', $order_id)
            ->where('garage_id', auth()->user()->garage->id)
            ->firstOrFail();



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


            return back()->with('success',__('website.reject_order'));



    }





}
