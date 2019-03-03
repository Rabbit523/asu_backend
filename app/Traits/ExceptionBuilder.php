<?php

namespace App\Traits;

trait ExceptionBuilder
{
    /**  
    * Build the Exception  
    *  
    * @param array $args  
    * @return string  
    */  
    protected function build(array $args)  
    {  
        $this->id = array_shift($args);

        $error = config(sprintf('errors.%s', $this->id));

        $this->title = $error['title'];  
        $this->detail = vsprintf($error['detail'], $args);

        return $this->detail;  
    }  
}
