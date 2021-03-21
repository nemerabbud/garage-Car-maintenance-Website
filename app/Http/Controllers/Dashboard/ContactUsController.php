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
use App\Models\Plan;
use App\User;
use Illuminate\Http\Request;

class ContactUsController extends SupperController
{

    public function __construct()
    {
        parent::__construct();
        $this->route = "contacts";
        $this->path = "admin.contacts";

    }

    public function index(Request $request)
    {
        $items = ContactUs::latest();

        if (\request()->has('from_date') && !empty($request->from_date))
            $items->whereDate('created_at', '>=', $request->from_date);

        if (\request()->has('to_date') && !empty($request->to_date))
            $items->whereDate('created_at', '<=', $request->to_date);

        if (\request()->has('email') && !empty($request->email))
            $items->where('email', $request->email);

        if (\request()->has('mobile') && !empty($request->mobile))
            $items->where('mobile',  $request->mobile);


        $items = $items->get();
        return view("{$this->path}.home", compact('items'));
    }

    public function create()
    {
//        return view();
    }


    public function store(Request $request)
    {


    }


    public function show(ContactUs $contactUs)
    {

        if (empty($contactUs->read_at))
            $contactUs->update(['read_at' => now()]);

        return view("{$this->path}.message", ['item' => $contactUs]);

    }


    public function edit($id)
    {

    }


    public function update(Request $request, $id)
    {
        //
    }


    public function destroy(ContactUs $contactUs)
    {

        $contactUs->delete();

        return 'success';


    }
}
