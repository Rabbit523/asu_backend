<?php

namespace App;

use Spatie\Tags\HasTags;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\MorphToMany;

class Channel extends Model
{
    use HasTags;

    const PAGINATION = [
        'max-results' => 10
    ];
    
    const TYPE = [
        "Public",
        "A-State",
    ];

    protected $casts = [
        'meta' => 'array',
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
        'meta',
        'required',
        'owner_id'
    ];

    public function tags()
    {
        return $this->morphToMany('App\Tag', 'taggable');
    }

    /**
     * Get the owner of a channel.
     */
    public function owner()
    {
        return $this->belongsTo('App\User', 'owner_id');
    }

    public function getCategoryAttribute()
    {
        $tag = $this->tags()->first();

        return $tag ? $tag->category : Category::make();
    }

    public function getTypeAttribute()
    {
        return $this->meta['is_public'] 
            ? array_first($this::TYPE) 
            : array_last($this::TYPE);
    }

    public function scopeByUser($query, $urls)
    {
        return $query
            ->where(function($query) use($urls) {
                foreach ($urls as $url){
                    $query->orWhere('meta->url', 'like', '%'.$url.'%');
                } 
            })
            ->orWhere('meta->is_public', true);
    }

}

