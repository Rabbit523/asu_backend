<?php

namespace App\Exceptions\Events;

use App\Exceptions\NotFoundException;

use App\Traits\ExceptionBuilder;

class EventNotFoundException extends NotFoundException  
{
    use ExceptionBuilder;
}  