<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\ContactUs;
use App\Models\GarageRequest;
use App\Models\Language;
use App\Models\Setting;
use App\User;
use Illuminate\Http\Request;

class SupperController extends Controller
{
    public function __construct()
    {
        auth()->setDefaultDriver('admin'); // can used it in supper controller


    }
}
