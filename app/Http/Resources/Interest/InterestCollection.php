<?php

namespace App\Http\Resources\Interest;

use Illuminate\Http\Resources\Json\ResourceCollection;

class InterestCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'data' => InterestResource::collection($this->collection),
        ];
    }

    public function with($request)
    {
        return [
            'links'    => [
                'self' => route('interests.index'),
            ],
        ];
    }
}
