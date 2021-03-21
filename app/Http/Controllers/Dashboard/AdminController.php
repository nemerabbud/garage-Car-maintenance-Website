<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\AdminRequest;
use App\Http\Requests\CarTypeRequest;
use App\Http\Requests\CategoryRequest;
use App\Http\Requests\PlanRequest;
use App\Http\Requests\UserRequest;
use App\Models\Admin;
use App\Models\CarType;
use App\Models\Category;
use App\Models\Permission;
use App\Models\Plan;
use App\Models\UserPermission;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Validator;

class AdminController extends SupperController
{

    public function __construct()
    {
        parent::__construct();
        $this->route = "admins";
        $this->path = "admin.admin";

        $this->middleware('AdminPermission:admins')->only('index', 'create', 'store');
    }


    public function index(Request $request)
    {
        $users = Admin::where('id','<>',1)->latest();

        if (\request()->has('email') && !empty($request->email))
            $users->where('email', $request->email);
        $users = $users->get();
        return view("{$this->path}.home", ['items' => $users]);

    }


    public function create()
    {

        $permissions = Permission::all();
        return view("{$this->path}.create", compact('permissions'));
    }


    public function store(Request $request)
    {


        $roles = [
            'name' => 'required|string',
            'email' => 'required|string|email|max:191|unique:admins',
            'password' => 'required|min:6',
            'confirm_password' => 'required|min:6|same:password',
            'permissions' => 'required|array',
            'permissions.*' => 'required|exists:permissions,roleSlug',
        ];
        $data = $this->validate($request, $roles);

        $permissions = implode(',', $data['permissions']);


        $admin = Admin::create(Arr::except($data, ['permissions', 'confirm_password']));
        /// add permission to admin
        UserPermission::create(['user_id' => $admin->id, 'permission' => $permissions]);


        return redirect()->back()->with('status', __('cp.create'));
    }


    public function show($id)
    {
        //
    }


    public function edit(Admin $admin)
    {


        if (auth()->id() !== $admin->id && !can('admins'))
            abort(403);

        return view("{$this->path}.edit", ['item' => $admin]);
    }


    public function update(Request $request, Admin $admin)
    {
        if (auth()->id() !== $admin->id && !can('admins'))
            abort(403);

        $roles = [
            'name' => 'required|string',
            'email' => 'required|string|email|max:191|unique:admins,email,' . $admin->id,
        ];
        $data = $this->validate($request, $roles);
        $admin->update($data);

        return redirect()->back()->with('status', __('cp.update'));

    }


    public function destroy(Admin $admin)
    {

        $admin->delete();

        return response()->json(['status' => true, 'message' => 'success']);


    }


    public function edit_password(Request $request, Admin $admin)
    {

        return view("{$this->path}.edit_password", ['item' => $admin]);
    }


    public function update_password(Request $request, Admin $admin)
    {
        $roles = array(
            'password' => 'required|min:6',
            'confirm_password' => 'required|same:password|min:6',
        );
         $this->validate($request, $roles);

        $admin->update(['password' => $request->password]); // password encrypt in model by bcrypt() by call setPasswordAtrribute

        return redirect()->back()->with('status', __('cp.update'));
    }


}
