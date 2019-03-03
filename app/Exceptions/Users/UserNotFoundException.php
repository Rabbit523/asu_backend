<?php

namespace App\Exceptions\Users;

use App\Exceptions\NotFoundException;

use App\Traits\ExceptionBuilder;

class UserNotFoundException extends NotFoundException  
{
    use ExceptionBuilder;
}  