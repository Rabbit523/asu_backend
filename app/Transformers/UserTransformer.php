<?php

namespace App\Transformers;

use Carbon\Carbon;
use League\Fractal\TransformerAbstract;

use App\User;

class UserTransformer extends TransformerAbstract
{
    /**
     * A Fractal transformer.
     *
     * @return array
     */
    public function transform(User $user)
    {
        return [
            'id'              => (int) $user->id,
	        'name'            => $user->name,
            'email'           => $user->email,
            'graduation_date' => $user->profile->graduation_date,
            'student_id'      => $user->profile->student_id,
            'major'           => $user->profile->major,
            'location'        => $user->profile->location,
            'created_at'      => $user->created_at->toDateTimeString(),
            'last_login_at'   => $user->last_login_at
        ];
    }
}
