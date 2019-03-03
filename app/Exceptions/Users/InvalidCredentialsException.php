<?php

namespace App\Exceptions\Users;

use App\Exceptions\UnauthorizedException;

use App\Traits\ExceptionBuilder;

class InvalidCredentialsException extends UnauthorizedException
{
    use ExceptionBuilder;
}  