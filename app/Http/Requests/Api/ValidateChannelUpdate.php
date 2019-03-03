<?php

namespace App\Http\Requests\Api;

use Illuminate\Validation\Rule;

use App\Channel;

class ValidateChannelUpdate extends BaseRequest
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
            'name' => 'sometimes|max:100',
            'is_public' => 'sometimes|boolean',
            'tags' => 'sometimes|array'
        ];
    }
}
