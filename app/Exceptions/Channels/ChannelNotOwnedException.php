<?php

namespace App\Exceptions\Channels;

use App\Traits\ExceptionBuilder;
use App\Exceptions\NotAllowedException;

class ChannelNotOwnedException extends NotAllowedException  
{
    use ExceptionBuilder;
}  