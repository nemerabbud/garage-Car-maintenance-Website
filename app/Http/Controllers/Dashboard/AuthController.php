<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\CarTypeRequest;
use App\Http\Requests\CategoryRequest;
use App\Http\Requests\PasswordRequest;
use App\Http\Requests\PlanRequest;
use App\Http\Requests\ProfileAdminRequest;
use App\Http\Requests\UserRequest;
use App\Models\CarType;
use App\Models\Category;
use App\Models\Plan;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends SupperController
{

    public function __construct()
    {
        parent::__construct();
    }

    public function edit_profile_page()
    {
        return view('dashboard.profile.edit_profile_page');
    }

    public function edit_profile(ProfileAdminRequest $request)
    {
        $user = Auth::user();

        $user->update($request->validated());

        return redirect()->back()->with('status', __('cp.update'));

    }


    public function edit_password_page()
    {
        return view('dashboard.profile.edit_password_page');
    }

    public function edit_password(PasswordRequest $request)
    {
        $user = Auth::user();

        $user->update(['password' => $request->password]);


        return redirect()->back()->with('status', __('cp.update'));

    }


}
