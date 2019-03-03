<?php

namespace App\Exceptions\Events;

use App\Exceptions\NotFoundException;

use App\Traits\ExceptionBuilder;

class JobNotFoundException extends NotFoundException  
{
    use ExceptionBuilder;
}  