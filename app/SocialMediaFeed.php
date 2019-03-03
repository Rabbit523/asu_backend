<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SocialMediaFeed extends Model
{
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
        'name', 'url'
    ];
}
