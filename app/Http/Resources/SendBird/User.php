<?php

namespace App\Http\Resources\SendBird;

use Illuminate\Http\Resources\Json\Resource;

class User extends Resource
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
            "has_ever_logged_in" => $this->resource['has_ever_logged_in'],
            "user_id" => $this->resource['user_id'],
            "last_seen_at" => $this->resource['last_seen_at'],
            "profile_url" => $this->resource['profile_url'],
        ];
    }
}
