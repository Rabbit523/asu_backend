<?php

namespace App\Http\Resources\Profile;

use Illuminate\Http\Resources\Json\Resource;

class ProfileResource extends Resource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
       return [
            'type' => 'profile',
            'id' => (string) $this->id,
            'attributes' => [
                'name' => $this->name,
                'graduation_date'  => $this->profile['graduation_date'],
                'student_id'  => $this->profile['student_id'],
                'major'  => $this->profile['major'],
                'location'  => $this->profile['location'],
            ],
            'relationships' => new ProfileRelationshipResource($this),
        ];
    }
}
