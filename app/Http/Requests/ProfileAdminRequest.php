<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProfileAdminRequest extends FormRequest
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
        $is_update_email = $this->id?",email,{$this->id}":'';
        return [
            'name'=>'required|array',
            'email'=>'required|string|email|max:191|unique:admins'.$is_update_email,
            'mobile'=>'required|string',
            'image'=>'nullable|image|mimes:jpeg,jpg,png,gif'
        ];
    }
}
