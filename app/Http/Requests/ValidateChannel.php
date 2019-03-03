<?php

namespace App\Http\Requests;

use Illuminate\Validation\Rule;
use Illuminate\Foundation\Http\FormRequest;

use App\Channel;

class ValidateChannel extends FormRequest
{
    protected $errorBag = 'form';

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize() {
        return $this->user()->can("channel.{$this->validateAs()}");
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required|max:100',
            'is_public' => 'boolean',
            'tags' => 'required|array',
            'required' => 'boolean'
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
        return request()->isMethod('post') ? 
            "store"
        :
            "update";
    }
}
