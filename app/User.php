<?php

namespace App;

use Spatie\Tags\HasTags;
use Laravel\Passport\HasApiTokens;
use Cog\Laravel\Ban\Traits\Bannable;
use Spatie\Permission\Traits\HasRoles;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Cog\Contracts\Ban\Bannable as BannableContract;
use Illuminate\Foundation\Auth\User as Authenticatable;

use App\Notifications\MailResetPasswordToken;

class User extends Authenticatable implements BannableContract
{
    use Notifiable, HasRoles, SoftDeletes, Bannable, HasApiTokens, HasTags;

    const PAGINATION = [
        'max-results' => 10
    ];

    protected $casts = [
        'meta' => 'array',
        'profile' => 'array',
    ];

    /**
     * Add necessary date fields are to be used as Carbon instances.
     *
     * @var array
     */
    protected $dates = ['created_at', 'updated_at', 'deleted_at', 'last_login_at', 'banned_at'];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'profile', 'meta'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    protected $attributes = array(
        'profile' => '{
                "major": null,
                "status": null,
                "location": null,
                "student_id": null,
                "graduation_date": null
            }'
    );

    public function posts()
    {
        return $this->hasMany(Post::class);
    }

    public function complaints()
    {
        return $this->hasManyThrough(Complaint::class, User::class, 'id', 'created_by_id');
    }

    public function reports()
    {
        return $this->hasManyThrough(Complaint::class, Post::class, 'user_id', 'bannable_id');
    }

    public function events()
    {
        return $this->belongsToMany(Event::class)
        ->withTimestamps()
        ->withPivot('followed_at', 'confirmed_at');
    }

    public function tags()
    {
        return $this->morphToMany('App\Tag', 'taggable');
    }

    public function scopeUsers($query)
    {
        return $query->whereHas('roles', function ($query) {
            $query->whereIn('roles.name', Role::APP_ROLES);
        });
    }

    public function scopeAdministrators($query)
    {
        return $query->whereHas('roles', function ($query) {
            $query->where('roles.name', Role::ADMIN_TYPE);
        });
    }

    public function scopeConfirmedOnes($query)
    {
        return $query->whereNotNull('confirmed_at');
    }

    public function scopeInterestedOnes($query)
    {
        return $query->whereNotNull('followed_at');
    }

    /**
     * Encrypt all passwords before creating a user.
     *
     * @param $password
     */
    public function setPasswordAttribute($password) {
        $this->attributes['password'] = bcrypt($password);
    }

    public function setNameAttribute($name) {
        $this->attributes['name'] = humanize($name);
    }

    /**
     * Send a password reset email to the user
     */
    public function sendPasswordResetNotification($token) {
        $this->notify(new MailResetPasswordToken($token));
    }

    function delete()
    {
        $this->reports()->delete();
        $this->complaints()->delete();
        
        parent::delete();
    }
}
