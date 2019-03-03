<?php

namespace App\Http\Resources\Job;

use Illuminate\Http\Resources\Json\Resource;

use App\Http\Resources\JobTagsRelationshipResource;

class JobRelationshipResource extends Resource
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
            'tags' => (new JobTagsRelationshipResource($this->tags))->additional(['job' => $this]),
        ];
    }
    public function with($request)
    {
        return [
            'links' => [
                'self' => route('jobs.index'),
            ],
        ];
    }
}
