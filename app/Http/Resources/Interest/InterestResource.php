<?php

namespace App\Http\Resources\Interest;

use Illuminate\Http\Resources\Json\Resource;

class InterestResource extends Resource
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
            'type' => 'interest',
            'id' => (string) $this->id,
            'attributes' => [
                'name' => $this->name,
            ],
        ];
    }
}
