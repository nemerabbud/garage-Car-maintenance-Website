<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\ContactUs;
use App\Models\Garage;
use App\Models\Page;
use App\Models\Service;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class AppController extends Controller
{


    public function __construct()
    {
        $this->path = "website.pages";
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function home(Request $request)
    {
        $minutes = 3600;// 1 day
        $count_user = Cache::remember('count_user', $minutes, function () {
            return User::count();
        });
        $count_services = Cache::remember('count_services', $minutes, function () {
            return Service::count();
        });


        $categories = Category::limit(8)->get();
        $garages = Garage::with('user')->active()->where('is_special', 1)->get();

        return view("{$this->path}.home", compact('count_user', 'categories', 'garages' ,'count_services'));
    }


    public function pages(Page $page)
    {

        return view("{$this->path}.$page->name", compact('page'));

    }
    public function contact_us()
    {

        $title = __("website.contact_us");


        return view("{$this->path}.contact_us", compact('title'));

    }


    public function create_contact_us(Request $request)
    {
        $response = $this->validate($request, ContactUs::DataValidationRule);


        ContactUs::create($response);


        $message = __('api.will_reply_on_you_in_faster_time');

        return back()->with(['success' => $message]);


    }

}
