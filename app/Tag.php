<?php

namespace App;

use Spatie\Tags\Tag AS SpatieTag;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Tag extends SpatieTag
{
    const PAGINATION = [
        'max-results' => 10
    ];

    /**
     * The possible types a tag can be.
     */
    const TYPE = [
        'channel',
        'event',
        'job',
        'post',
        'user'
    ];

    public function taggable()
    {
        return $this->morphTo();
    }

    public function scopeType(Builder $query, $type): Builder
    {
        return $query->where('type', $type);
    }

    /**
     * Get the author of the post.
     */
    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function channels()
    {
        return $this->morphedByMany(Channel::class, 'taggable');
    }

    public function scopeInterests($query)
    {
        return $query->where('type', self::TYPE[4]);
    }
}
