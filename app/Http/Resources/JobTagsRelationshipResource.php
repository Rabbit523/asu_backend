<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class JobTagsRelationshipResource extends ResourceCollection
{
    public function toArray($request)
    {
        $job = $this->additional['job'];

        return [
            'data'  => TagIdentifierResource::collection($this->collection),
        ];
    }
    public function with($request)
    {
        return [
            'links' => [
                'self' => route('jobs.index'),
            ],
        ];
    }
}
