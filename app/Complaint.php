<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Complaint extends Model
{
    use SoftDeletes; 

    protected $table = 'bans';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'comment',
        'expired_at',
        'updated_at', 
        'deleted_at'
    ];
    
    public function bannable()
    {
        return $this->morphTo();
    }

    public function created_by() 
    {
        return $this->morphTo();
    }

    public function informants()
    {
        return $this->belongsTo(User::class, 'created_by_id')
            ->whereCreatedByType(User::class);
    }

    public function posts()
    {
        return $this->belongsTo(Post::class, 'bannable_id')
            ->whereBannableType(Post::class);
    }

}
