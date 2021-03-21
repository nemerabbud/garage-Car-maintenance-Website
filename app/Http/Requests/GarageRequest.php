<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class GarageRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $is_update_email = $this->user_id ? ",email,{$this->user_id}" : '';
        $is_required = $this->_method ? "nullable" : 'required';

        return [

            ////start user info
            'name' => 'required|string',
            'email' => 'required|string|email|max:191|unique:users' . $is_update_email,
            'mobile' => 'required|string',
            'image' => 'nullable|image|mimes:jpeg,jpg,png,gif',
            'password' => $is_required . '|string|min:6',
            /// end user valid

            ////start garage info
            'lat' => 'required|string',
            'lng' => 'required|string',

            'category_id' => 'required|numeric|exists:categories,id',
            'plan_id' => 'required|numeric|exists:plans,id',
            'updated_plan' => 'nullable|string',
            /// multi lang data
            'en' => 'required|array',
            'en.description' => 'required|string',
            'en.address' => 'required|string',
            'ar' => 'required|array',
            'ar.description' => 'required|string',
            'ar.address' => 'required|string',

            // services validation

            'services' => 'required|array',
            'services.*' => 'required|numeric|exists:services,id',

            // end services validation

            // start car_types validation

            'car_types' => 'required|array',
            'car_types.*' => 'required|numeric|exists:car_types,id',

            // end car_types validation

            'images' => 'required|array',
            'images.*' => 'required|image|mimes:jpeg,jpg,png,gif',

            'deleted_images' => 'nullable|array',
            'deleted_images.*' => 'required|numeric|exists:garage_images,id',




        ];
    }
}
