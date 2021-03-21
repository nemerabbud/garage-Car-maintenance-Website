<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SupperController extends Controller
{

    public function __construct()
    {
        auth()->setDefaultDriver('api');// change default guard


        if (\request()->hasHeader('accept-language')) {
            app()->setLocale(\request()->header('accept-language'));
        }


    }

    /// start format paginate Data
    public function formatPaginationData($data, $data_resource = '')
    {

        $data = $data->toArray();
        $data['data'] = $data_resource;

        return $data;

    } // end


/// start custom validation to api
    public function custom_validation($data, $condition)
    {
        $validate = Validator::make($data, $condition);
        if ($validate->fails()) {

            return response([
                'status' => false,
                'code' => 400,
                'message' => implode('\n', $validate->errors()->all())
            ]);
        }
        return true;
    }
    /// end ApiValidation
}
