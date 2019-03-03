<?php

namespace App\Exceptions;

use Exception;

abstract class ApiBaseException extends Exception
{  
    /**  
    * @var string  
    */  
    protected $id;
    
    /**  
    * @var string  
    */  
    protected $status;
    
    /**  
    * @var string  
    */  
    protected $title;
    
    /**  
    * @var string  
    */  
    protected $detail;
    
    /**  
    * @param @string $message  
    * @return void  
    */  
    public function __construct($message)  
    {  
        parent::__construct($message);  
    }  

    /**  
    * Get the status  
    *  
    * @return int  
    */  
    public function getStatus()  
    {  
        return (int) $this->status;  
    }  

    /**  
    * Return the Exception as an array  
    *  
    * @return array  
    */  
    public function toArray()  
    {  
        return [
            'errors' => [  
                $this->id => [  
                    'status' => $this->status,  
                    'title' => $this->title,  
                    'detail' => $this->detail  
                ]
            ]
        ];  
    } 
}  