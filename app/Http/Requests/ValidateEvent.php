<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ValidateEvent extends FormRequest
{
    protected $errorBag = 'form';

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize() {
        return $this->user()->can("event.{$this->validateAs()}");
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules() {
        return [
            'name' => 'required|max:100',
            'address' => 'required|max:100',
            'city' => 'required|max:60',
            'state' => 'required|max:60',
            'zip_code' => 'required|max:20',
            'date' => 'required|date|after:yesterday',
            'time' => 'required|date_format:H:i:s',
            'description' => 'required|max:600',
            'picture' => 'sometimes|image|mimes:jpeg,jpg,png',
            'tags' => 'required|array',
        ];
    }

    protected function getValidatorInstance() {
        $validator = parent::getValidatorInstance();

        if ($validator->fails()) {
            $validator->after(function($validator) {
                $validator->errors()->add('action', $this->validateAs());
            });
        }
        return $validator;
    }

    public function validateAs() {
        return request()->isMethod('post') 
            ? "store"
            : "update";
    }

}
