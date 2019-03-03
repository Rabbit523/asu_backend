<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class ProfileInterestsRelationshipResource extends ResourceCollection
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
        $profile = $this->additional['profile'];
        return [
            'data'  => InterestIdentifierResource::collection($this->collection),
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
