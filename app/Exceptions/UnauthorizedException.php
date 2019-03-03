<?php

namespace App\Exceptions;

use Exception;

class UnauthorizedException extends ApiBaseException
{  
    /**  
    * @var string  
    */  
    protected $status = '401';

    /**  
    * @return void  
    */  
    public function __construct()  
    {  
        $message = $this->build(func_get_args());

        parent::__construct($message);  
    }  
}