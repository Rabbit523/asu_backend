<?php

namespace App\Http\Resources\Event;

use Illuminate\Http\Resources\Json\Resource;

use App\Http\Resources\EventTagsRelationshipResource;

class EventRelationshipResource extends Resource
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
            'tags' => (new EventTagsRelationshipResource($this->tags))->additional(['event' => $this]),
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
