<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\CarTypeRequest;
use App\Http\Requests\CategoryRequest;
use App\Http\Requests\GarageRequest;
use App\Http\Requests\PlanRequest;
use App\Http\Requests\UserRequest;
use App\Models\CarType;
use App\Models\Category;
use App\Models\Garage;
use App\Models\Order;
use App\Models\Plan;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class OrderController extends SupperController
{

    public function __construct()
    {
        parent::__construct();
        $this->route = "orders";
        $this->path = "admin.orders";

    }


    public function index(Request $request)
    {
        $items = Order::with('user','garage.user');

            $items->whereHas('user', function ($user) use ($request) {

                if (\request()->has('mobile') && !empty($request->mobile))
                    $user->where('mobile', $request->mobile);

                if (\request()->has('userName') && !empty($request->userName))
                    $user->where('name','like', "%$request->userName%");
            });

        if (\request()->has('status') && !empty($request->status))
            $items->where('status', $request->status);

        $items=$items->latest()->paginate(50);

        return  view("{$this->path}.home",compact('items'));
    }

    public function create()
    {
        //
    }


    public function store(Request $request)
    {


    }


    public function show($id)
    {
        $order = Order::with(['user', 'garage','garage.user', 'services','images'])->findOrFail($id);
        return view("{$this->path}.show", compact('order'));

    }


    public function edit($id)
    {
        $order = Order::with(['user', 'garage', 'services'])->findOrFail($id);
        return view("{$this->path}.edit", compact('order'));


    }


    public function update(Request $request, $id)
    {

        //

    }


    public function destroy(Order $order)
    {

        $order->delete();

        return response()->json(['status' => true, 'message' => 'success']);


    }
}
