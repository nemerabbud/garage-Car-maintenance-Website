<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AdminRequest extends FormRequest
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
        $is_required = $this->_method?"nullable":'required';
        return [
            'name'=>'required|string',
            'email'=>'required|string|email|max:191|unique:admins'.$is_update_email,
            'password' => $is_required.'|string|min:6'


        ];
    }
}
