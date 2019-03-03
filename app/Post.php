<?php

namespace App;

use Cog\Laravel\Ban\Traits\Bannable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Cog\Contracts\Ban\Bannable as BannableContract;

use App\Complaint;

class Post extends Model implements BannableContract
{
    use Bannable, SoftDeletes;

    protected $dates = ['created_at', 'updated_at', 'bannet_at', 'deleted_at'];
    
    protected $fillable = ['title', 'body'];
    
    public function author(){
        return $this->BelongsTo(User::class, 'user_id');
    }

    public function complaints()
    {
        return $this->morphMany(Complaint::class, 'bannable');
    }

}