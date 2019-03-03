<?php

namespace App\Http\Resources\Channel;

use Illuminate\Http\Resources\Json\Resource;

use App\Http\Resources\ChannelCategoryRelationshipResource;

class ChannelRelationshipResource extends Resource
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
            'category' => (new ChannelCategoryRelationshipResource($this->category))->additional(['channel' => $this]),
        ];
    }
    public function with($request)
    {
        return [
            'links' => [
                'self' => route('channels.index'),
            ],
        ];
    }
}
