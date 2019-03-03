<?php

namespace App\Exceptions\Channels;

use App\Exceptions\NotFoundException;

use App\Traits\ExceptionBuilder;

class ChannelNotFoundException extends NotFoundException  
{
    use ExceptionBuilder;
}  