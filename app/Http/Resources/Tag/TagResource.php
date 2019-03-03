<?php

namespace App\Http\Resources\Tag;

use Illuminate\Http\Resources\Json\Resource;

class TagResource extends Resource
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
            'type' => 'tag',
            'id' => (string) $this->id,
            'attributes' => [
                'name' => $this->name,
            ],
        ];
    }
}
