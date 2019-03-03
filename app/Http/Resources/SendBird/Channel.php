<?php

namespace App\Http\Resources\SendBird;

use Illuminate\Http\Resources\Json\Resource;

class Channel extends Resource
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
            'member_count' => $this->resource['member_count'] ?? $this->resource['participant_count'] ?? 0,
            'created_at' => $this->resource['created_at'],
            'is_public' => $this->resource['is_public'] ?? true,
            'is_distinct' => $this->resource['is_distinct'] ?? true,
            'is_ephemeral' => $this->resource['is_ephemeral'],
            'joined_member_count' => $this->resource['joined_member_count'] ?? $this->resource['participant_count'] ?? 0,
            'url' => $this->resource['channel_url'],
            'custom_type' => $this->resource['custom_type'],
            'is_super' => $this->resource['is_super'] ?? false,
            'last_message' => $this->resource['last_message'] ?? '',
            'freeze' => $this->resource['freeze'] ?? false,
        ];
    }
}
