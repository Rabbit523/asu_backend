<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class TagIdentifierResource extends Resource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request
     *
     * @return array
     */
    public function toArray($request)
    {
        return [
            'type'          => 'tag',
            'name'          => (string)$this->name,
            'id'            => (int)$this->id,
        ];
    }
}
