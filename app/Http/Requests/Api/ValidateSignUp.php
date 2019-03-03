<?php

namespace App\Http\Requests\Api;

class ValidateSignUp extends BaseRequest
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

    public function rules()
    {
        return [
            'email' => 'required|string|email|unique:users',
            'password' => 'required|string|confirmed',
            'role'     => 'required|exists:roles,name'
        ];
    }
}