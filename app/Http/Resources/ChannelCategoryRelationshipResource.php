<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class ChannelCategoryRelationshipResource extends Resource
{
    public function toArray($request)
    {
        $channel = $this->additional['channel'];
        return [
            'data'  => new CategoryIdentifierResource($this->resource),
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
