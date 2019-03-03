<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use \Illuminate\Auth\Access\AuthorizationException;

class StoreAdministrator extends FormRequest
{
    protected $errorBag = 'form';

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize() {
        return $this->user()->can('admin.store');
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules() {
        return [
            'name'     => 'required|max:80',
            'email'    => 'required|email|unique:users',
            'password' => 'required|confirmed|min:6|max:12',
            'role'     => 'required|exists:roles,id',
        ];
    }

    protected function getValidatorInstance() {
        $validator = parent::getValidatorInstance();

        if ($validator->fails()) {
            $validator->after(function($validator) {
                $validator->errors()->add('action', 'store');
            });
        }
        return $validator;
    }

}
