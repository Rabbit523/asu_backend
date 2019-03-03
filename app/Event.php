<?php

namespace App;

use Carbon\Carbon;
use Spatie\Tags\HasTags;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia\HasMediaTrait;
use Spatie\MediaLibrary\HasMedia\Interfaces\HasMedia;

class Event extends Model implements HasMedia
{
    use HasTags, HasMediaTrait;

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
        'name',
        'address',
        'city',
        'state',
        'zip_code',
        'date',
        'time',
        'description',
        'attendees',
    ];

    public function users()
    {
        return $this->belongsToMany(User::class)
        ->withTimestamps()
        ->withPivot('followed_at', 'confirmed_at');
    }

    public function tags()
    {
        return $this->morphToMany('App\Tag', 'taggable');
    }

    /**
     * Get the event's location.
     *
     * @return string
     */
    public function getPictureAttribute()
    {
        $pictures = $this->getMedia('images');

        $url = $pictures->isEmpty() ? "" : $pictures->first()->getUrl();

        return $url;
    }

    public function getHumanizedDateAttribute() 
    {
        $date = Carbon::parse($this->date, config('timezone'));
        return $date->format('l, F d, Y');
    }

    public function getInterestedAttribute() 
    {
        return ! is_null(
            $this->users()
                 ->where('user_id', auth()->user()->id)
                 ->first()
        );
    }
}
