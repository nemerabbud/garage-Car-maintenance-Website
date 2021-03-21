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
use App\Models\Garage;
use App\Models\Order;
use App\Models\Plan;
use App\User;
use Illuminate\Http\Request;

class HomeController extends SupperController
{

    public function __construct()
    {
        parent::__construct();
        $this->route = "home";

    }

    public function home()
    {
        $users_count = User::where('role','customer')->count();
        $garage_count = Garage::count();
        $count_categories = Category::count();
        $count_orders = Order::count();
        $contact  = ContactUs::count();
        return  view('admin.home.dashboard',compact('users_count','garage_count','count_categories','count_orders','contact'));
    }

    public function changeStatus($model,Request $request)
    {

          $models = [
              'admins'=>'App\Models\Admin',
              'plans'=>'App\Models\Plan',
              'categories'=>'App\Models\Category',
              'services'=>'App\Models\Service',
              'carTypes'=>'App\Models\CarType',
              'advertisements'=>'App\Models\Advertisement',
              'sliders'=>'App\Models\Slider',
              'users'=>'App\User',
          ];


        $role = $models[$model];



        if($role !=""){
            if ($request->action == 'delete') {
                $role::query()->whereIn('id', $request->IDsArray)->delete();
            }
            else {
                if($request->action) {
                    $role::query()->whereIn('id', $request->IDsArray)->update(['status' => $request->action]);
                }
            }

            return $request->action;
        }
        return false;


    }

}
