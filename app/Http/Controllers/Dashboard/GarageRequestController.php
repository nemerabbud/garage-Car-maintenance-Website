<?php

namespace App\Http\Controllers\Dashboard;


use App\Mail\AcceptGarageRequest;
use App\Mail\RejectGarageRequest;
use App\Models\GarageRequest;
use App\Models\Language;
use App\Models\Order;
use App\Models\Plan;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

class GarageRequestController extends SupperController
{

    public function __construct()
    {
        parent::__construct();
        $this->route = "garage_requests";
        $this->path = "admin.garage_requests";

    }


    public function index(Request $request)
    {
        $items = GarageRequest::latest();
        if($request->filled('status')){
            $items->where('status',$request->get('status'));
        }  
        if($request->filled('mobile')){
            $items->where('mobile',$request->get('mobile'));
        }
  if($request->filled('owner_name')){
            $items->where('owner_name',$request->get('owner_name'));
        }

        $items=$items->paginate(10);

        return  view("{$this->path}.home",compact('items'));
    }


    public function create()
    {
        //
    }


    public function store(Request $request)
    {


    }


    public function show(GarageRequest $garageRequest)
    {
        return view("{$this->path}.show", compact('garageRequest'));

    }


    public function edit($id)
    {


    }


    public function update(Request $request, GarageRequest $garageRequest)
    {
        $roles = [
            'status' => 'required|string',
        ];


        if ($request->has('status') && $request->status == 'accepted'){ /// add to validation id status accepted
            $request->merge(['email'=>$garageRequest->email]) ; // ad email to validation to check email if user have email
            $roles  ['email'] = 'required|string|email|max:191|unique:users';

        }


        $locales = Language::all()->pluck('lang');


         $this->validate($request, $roles);

        try {
            DB::beginTransaction();

            if ($request->status == 'accepted') {
                $user_data = [
                    'name' => $garageRequest->owner_name,
                    'email' => $garageRequest->email,
                    'role' => 'garage',
                    'mobile' => $garageRequest->mobile,

                    'password' => Str::random(9),/// it's bcrypt in user model
                    'image' => $garageRequest->logo,
                ];

                $garage_data = [];
                $garage_data['status'] = 'not_active';
                $garage_data['lat'] = $garageRequest->lat;
                $garage_data['lng'] = $garageRequest->lng;
                foreach ($locales as $locale) {
                    $garage_data[$locale]["description"] = $garageRequest->translate($locale)->description;
                    $garage_data[$locale]["address"] = $garageRequest->translate($locale)->address;
                    $garage_data[$locale]["name"] = $garageRequest->translate($locale)->title;

                }


                $user = User::create($user_data);

                $garage = $user->garage()->create($garage_data);/// create  garage to user ;
                $garageRequest->update(['status'=>$request->status]);
                 Mail::to($garageRequest->email)->send(new AcceptGarageRequest($garageRequest->email ,$user_data['password']));


            }else{ // if rejected request
                $garageRequest->update(['status'=>$request->status,'reason_reject_message'=>$request->reason_reject_message]);

                Mail::to($garageRequest->email)->send(new RejectGarageRequest($garageRequest->email ,$request->reason_reject_message ));

            }
            DB::commit();

            return redirect()->back()->with('status', __('cp.ok'));
        } catch (\Exception $exception) {
            DB::rollBack();
            return redirect()->back()->with('errors', __('cp.errors'));

        }

    }


    public function destroy(Order $order)
    {

        $order->delete();

        return response()->json(['status' => true, 'message' => 'success']);


    }
}
