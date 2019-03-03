<?php

return [
/*  
|—————————————————————————————————————  
| Default Errors  
|—————————————————————————————————————  
*/
    "bad_request" => [  
        "title" => "The server cannot or will not process the request due to something that is perceived to be a client error.",  
        "detail" => "Your request had an error. Please try again."  
    ],

    "forbidden" => [  
        "title" => "The request was a valid request, but the server is refusing to respond to it.",  
        "detail" => "Your request was valid, but you are not authorised to perform that action."  
    ],

    "not_found" => [  
        "title" => "Resource could not be found",  
        "detail" => "The resource you were looking for was not found but may be available again in the future. Subsequent requests by the client are permissible.."  
    ],

    "precondition_failed" => [  
        "title" => "The server does not meet one of the preconditions that the requester put on the request.",  
        "detail" => "Your request did not satisfy the required preconditions."  
    ],

    "invalid_credentials" => [  
        "title" => "Unauthorized.",  
        "detail" => "The credentials doesn't match with any record."  
    ],

    "user_not_found" => [  
        "title" => "The requested resource doesn't exists",  
        "detail" => "Your request points to a missing resource [%s]."  
    ]
];  