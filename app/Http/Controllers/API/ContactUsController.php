<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\Ads as AdsResource;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\ServiceResource;
use App\Models\Category;
use App\Models\ContactUs;
use App\Models\Service;
use Illuminate\Http\Request;

class ContactUsController extends SupperController
{
    public function __construct()
    {

        parent::__construct();
    }

    public function create_contact_us(Request $request)
    {
        $response = $this->custom_validation($request->all(), ContactUs::DataValidationRule);
        if ($response !== true)
            return $response;

        ContactUs::create($request->only('name', 'mobile', 'email', 'description'));


        $message = __('api.will_reply_on_you_in_faster_time');

        return response()->json(['status' => true, 'code' => 200, 'message' => $message]);


    }


}
