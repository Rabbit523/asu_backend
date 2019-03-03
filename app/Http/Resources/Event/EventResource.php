<?php

namespace App\Http\Resources\Event;

use Illuminate\Http\Resources\Json\Resource;

use App\Traits\FieldFilter;

class EventResource extends Resource
{
    use FieldFilter;

    public static function collection($resource)
    {
        return tap(new EventResourceCollection($resource), function ($collection) {
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
            'type' => 'event',
            'id' => (string) $this->id,
            'attributes' => $this->filterFields([
                'name' => $this->name,
                'address' => $this->address,
                'city' => $this->city,
                'state' => $this->state,
                'zip_code' => $this->zip_code,
                'date' => $this->humanized_date,
                'time' => $this->time,
                'description' => $this->description,
                'attendees' => $this->attendees,
                'image' => $this->picture,
                'interested' => $this->interested,
            ]),
            'relationships' => new EventRelationshipResource($this),
        ];
    }
}
