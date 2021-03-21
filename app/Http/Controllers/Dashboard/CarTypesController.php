<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\CarTypeRequest;
use App\Http\Requests\PlanRequest;
use App\Models\CarType;
use App\Models\Plan;
use Illuminate\Http\Request;

class CarTypesController extends SupperController
{

    public function __construct()
    {
        parent::__construct();
        $this->route = "carTypes";
        $this->path = "admin.carTypes";

    }


    public function index()
    {
        $items = CarType::latest()->get();

        return view("{$this->path}.home", ['items' => $items]);

    }

    public function create()
    {
        return view("{$this->path}.create");
    }


    public function store(Request $request)
    {
        $roles = [

            'title' => 'required|string',
        ];

        $data = $this->validate($request, $roles);

        CarType::create($data);


        return redirect()->back()->with('status', __('cp.create'));
    }


    public function show($id)
    {
        //
    }


    public function edit(CarType $carType)
    {
        return view("{$this->path}.edit", ['item' => $carType]);
    }


    public function update(Request $request, CarType $carType)
    {


        $roles = [

            'title' => 'required|string',
        ];

        $data = $this->validate($request, $roles);
        $carType->update($data);

        return redirect()->back()->with('status', __('cp.update'));

    }


    public function destroy(CarType $carType)
    {

        $carType->delete();
        return response()->json(['status' => true, 'message' => 'success']);


    }
}
