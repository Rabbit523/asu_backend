<?php

namespace App;

use Carbon\Carbon;
use Spatie\Tags\HasTags;
use Illuminate\Database\Eloquent\Model;

class Job extends Model
{
    use HasTags;

    const PAGINATION = [
        'max-results' => 10
    ];

    /**
     * Add necessary date fields are to be used as Carbon instances.
     *
     * @var array
     */
    protected $dates = ['created_at', 'updated_at'];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'title',
        'description',
        'city',
        'state',
        'zip_code',
        'company',
        'url',
    ];

    public function tags()
    {
        return $this->morphToMany('App\Tag', 'taggable');
    }

    /**
     * Get the event's location.
     *
     * @return string
     */
    public function getLocationAttribute()
    {
        return "{$this->city}, {$this->state}, {$this->zip_code}";
    }

    public function getHumanizedTimeAttribute() 
    {
        $now = Carbon::now();
        
        return empty($this->created_at) 
            ? ""
            : str_replace("before", "ago", $this->created_at->diffForHumans($now));
    }
}
