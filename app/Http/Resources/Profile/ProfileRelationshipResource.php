<?php

namespace App\Http\Resources\Profile;

use Illuminate\Http\Resources\Json\Resource;

use App\Http\Resources\ProfileInterestsRelationshipResource;

class ProfileRelationshipResource extends Resource
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request
     *
     * @return array
     */
    public function toArray($request)
    {
        return [
            'interests' => (new ProfileInterestsRelationshipResource($this->tags))->additional(['profile' => $this]),
        ];
    }
    public function with($request)
    {
        return [
            'links' => [
                'self' => route('profiles.index'),
            ],
        ];
    }
}
