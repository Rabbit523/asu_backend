<?php

namespace App\SendBird;

use App\Http\Resources\SendBird\User;
use App\Http\Resources\SendBird\UserCollection;

class UserClient extends SendBirdApiClient {

    public function store($body) {
        $response = $this->makeRequest('users', 'POST', $body)->body;

        return User::make(collect($response))->resolve();
    }

    public function update($body, $id) {
        $response = $this->makeRequest("users/$id", "PUT", $body)->body;

        return User::make(collect($response))->resolve();
    }

    public function delete($id) {
        return $this->makeRequest("users/$id", "DELETE")->statusCode;
    }

}