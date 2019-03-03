<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
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
    ];

    public function tags()
    {
        return $this->hasMany(Tag::class);
    }
    
    public function channels()
    {
        return $this->tags()->with(array('channels' => function($query){
            $query->select('id');
        }));
    }
}
