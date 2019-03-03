<?php

namespace App\Http\Resources\Job;

use Illuminate\Http\Resources\Json\ResourceCollection;

use App\Traits\FieldFilter;

class JobResourceCollection extends ResourceCollection
{
     use FieldFilter; 

     /**
     * @var array
     */
    protected $withoutFields = [];
    
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request
     * @return array
     */
    public function toArray($request)
    {
        return $this->processCollection($request);
    }

    /**
     * Send fields to hide to UsersResource while processing the collection.
     * 
     * @param $request
     * @return array
     */
    protected function processCollection($request)
    {
        return $this->collection->map(function (JobResource $resource) use ($request) {
            return $resource->hide($this->withoutFields)->toArray($request);
        })->all();
    }
}
