<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PlanRequest extends FormRequest
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
        return [
            'en'=>'required|array',
            'en.title'=>'required|string',
            'en.description'=>'required|string',
            'ar'=>'required|array',
            'ar.title'=>'required|string',
            'ar.description'=>'required|string',
            'price'=>'required|numeric',
            'duration'=>'required|numeric',

        ];
    }
}
