<?php

namespace App\Exceptions;

use Exception;

class NotAllowedException extends ApiBaseException  
{  
    /**  
    * @var string  
    */  
    protected $status = '405';

    /**  
    * @return void  
    */  
    public function __construct()  
    {  
        $message = $this->build(func_get_args());

        parent::__construct($message);  
    }  
}