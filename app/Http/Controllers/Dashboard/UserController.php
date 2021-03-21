<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\CarTypeRequest;
use App\Http\Requests\CategoryRequest;
use App\Http\Requests\PlanRequest;
use App\Http\Requests\UserRequest;
use App\Models\CarType;
use App\Models\Category;
use App\Models\Plan;
use App\User;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;

class UserController extends SupperController
{

    public function __construct()
    {
        parent::__construct();
        $this->route = "users";
        $this->path = "admin.users";

    }


    public function index(Request $request)
    {
        $users = User::where('role', 'customer')->latest();

        if (\request()->has('email') && !empty($request->email))
            $users->where('email',$request->email);


        if (\request()->has('mobile') && !empty($request->mobile))
            $users->where('mobile',$request->mobile);


        if (\request()->has('statusUser') && !empty($request->statusUser))
            $users->where('status',$request->statusUser);


        $users = $users->get();



        return view("{$this->path}.home", ['items' => $users]);

    }


    public function create()
    {

        return view("{$this->path}.create");
    }


    public function store(Request $request)
    {

        $roles = [
            'name' => 'required|string',
            'email' => 'required|string|email|max:191|unique:users',
            'mobile' => 'required|string',
            'image' => 'nullable|image|mimes:jpeg,jpg,png,gif',
            'password' => 'required|string|min:6',
            'confirm_password' => 'required|same:password|min:6',


        ];
        $data = $this->validate($request, $roles);


        if ($request->hasFile('image'))// helper function to save
            $data['image'] = storeImage($request->file('image'), 'users');


        $data['role'] = 'customer';
        User::create($data);


        return redirect()->back()->with('status', __('cp.create'));
    }

    public function show($id)
    {
        //
    }


    public function edit(User $user)
    {

        $item = $user;
        return view("{$this->path}.edit", compact('item'));
    }


    public function update(Request $request, User $user)
    {

        $roles = [
            'name' => 'required|string',
            'mobile' => 'required|string',
            'image' => 'nullable|image|mimes:jpeg,jpg,png,gif',
        ];
        $data = $this->validate($request, $roles);


        if ($request->hasFile('image'))// helper function to save
            $data['image'] = storeImage($request->file('image'), 'users', $user->image);


        $user->update($data);

        return redirect()->back()->with('status', __('cp.update'));

    }


    public function destroy(User $user)
    {

        $user->delete();

        return response()->json(['status' => true, 'message' => 'success']);


    }

    function edit_password(User $user)
    {

        return view("{$this->path}.edit_password", ['item' => $user]);
    }


    public function update_password(Request $request, User $user)
    {
        $users_rules = array(
            'password' => 'required|min:6',
            'confirm_password' => 'required|same:password|min:6',
        );

        $this->validate($request, $users_rules);

        $user->update(['password' => $request->password]); // password encrypted in user model by bcrypt()



        return redirect()->back()->with('status', __('cp.update'));
    }

}
