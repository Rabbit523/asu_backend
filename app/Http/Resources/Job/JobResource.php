<?php

namespace App\Http\Resources\Job;

use Illuminate\Http\Resources\Json\Resource;

use App\Traits\FieldFilter;

class JobResource extends Resource
{
    use FieldFilter; 
    
    public static function collection($resource)
    {
        return tap(new JobResourceCollection($resource), function ($collection) {
            $collection->collects = __CLASS__;
        });
    }

    /**
     * @var array
     */
    protected $withoutFields = [];


    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'type' => 'job',
            'id' => (string) $this->id,
            'attributes' => $this->filterFields([
                'id' => $this->id,
                'title' => $this->title,
                'description' => $this->description,
                'city' => $this->city,
                'state' => $this->state,
                'zip_code' => $this->zip_code,
                'company' => $this->company,
                'time' => $this->humanized_time,
                'url' => $this->url,
            ]),
            'relationships' => new JobRelationshipResource($this),
        ];
    }    
}
