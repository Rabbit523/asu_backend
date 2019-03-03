<?php

namespace App\Http\Resources\SendBird;

use Illuminate\Http\Resources\Json\ResourceCollection;

class ChannelCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return Channel::collection($this->collection);
    }
}