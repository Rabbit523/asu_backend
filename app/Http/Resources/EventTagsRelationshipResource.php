<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class EventTagsRelationshipResource extends ResourceCollection
{
    public function toArray($request)
    {
        $event = $this->additional['event'];

        return [
            'data'  => TagIdentifierResource::collection($this->collection),
        ];
    }
    public function with($request)
    {
        return [
            'links' => [
                'self' => route('events.index'),
            ],
        ];
    }
}
