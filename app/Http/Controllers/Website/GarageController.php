<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Garage;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class GarageController extends Controller
{


    public function __construct()
    {
        $this->path = "website.garages";
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, $garage_id)
    {

        $garage = Garage::with(['user', 'images', 'services', 'category', 'reviews', 'reviews.user', 'carTypes'])
            ->findOrFail($garage_id);

        return view("{$this->path}.garage_info" ,compact('garage'));
    }
    public function all_garages(Request $request)
    {

        $garages = Garage::active()->with(['user']);
        if ( $request->has('search')) {
            $garages->whereTranslationLike('name',"%$request->search%");
        }
        $garages = $garages->paginate(12);

        return view("{$this->path}.all_garages" ,compact('garages'));
    }


}
