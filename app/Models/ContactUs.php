<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ContactUs extends Model
{
    protected $guarded =[];
    const  DataValidationRule =[
        'name' => 'required|string|max:100',
        'mobile' => 'required|string|max:50',
        'email' => ['required', 'string', 'email', 'max:191'],
        'description' => 'required|string',
    ];
}
