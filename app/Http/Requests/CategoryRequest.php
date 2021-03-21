<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CategoryRequest extends FormRequest
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
            'ar'=>'required|array',
            'ar.title'=>'required|string',
            'image'=>'required|image|mimes:jpeg,jpg,png,gif',

            'services'=>'required|array',
            'services.*'=>'required|numeric|exists:services,id',


        ];
    }
}
