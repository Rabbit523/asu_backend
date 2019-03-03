<?php

namespace App\Http\Resources\Profile;

use Illuminate\Http\Resources\Json\ResourceCollection;

class ProfileCollection extends ResourceCollection
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
            'data' => ProfileResource::collection($this->collection),
        ];
    }
    
    public function with($request)
    {
        return [
            'links'    => [
                'self' => route('profiles.index'),
            ],
        ];
    }
}
