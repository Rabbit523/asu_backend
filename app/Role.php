<?php

namespace App;

use Spatie\Permission\Models\Role as BaseRole;

class Role extends BaseRole
{
    const SUPER_ADMIN_TYPE = 'super-admin';
    const ADMIN_TYPE = 'admin';
    const APP_ROLES = [
        'student',
        'teacher'
    ];
    
    public function getNameAttribute($value) {
        return humanize($value);
    }
}
