<?php

namespace App\Http\Requests\Api;

class ValidateProfile extends BaseRequest
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
            'tags' => 'sometimes|array',
            'name' => 'sometimes|string|max:100',
            'major' => 'sometimes|string|max:100',
            'graduation_date' => 'sometimes|date',
            'status' => 'sometimes|string|max:140',
            'location' => 'sometimes|string|max:160',
            'student_id' => 'sometimes|string|max:30'
        ];
    }
}