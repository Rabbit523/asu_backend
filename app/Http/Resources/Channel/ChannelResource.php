<?php

namespace App\Http\Resources\Channel;

use Illuminate\Http\Resources\Json\Resource;

class ChannelResource extends Resource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
       return [
            'type' => 'channel',
            'id' => (string) $this->id,
            'attributes' => [
                'name' => $this->name,
                'url' => $this->meta['url'],
                'memberCount' => $this->meta['member_count'],
                'type' => $this->type,
                'isPublic' => $this->meta['is_public'],
            ],
            'relationships' => new ChannelRelationshipResource($this),
        ];
    }
}
