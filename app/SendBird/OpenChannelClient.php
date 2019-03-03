<?php

namespace App\SendBird;

use App\Http\Resources\SendBird\Channel;
use App\Http\Resources\SendBird\ChannelCollection;

class OpenChannelClient extends SendBirdApiClient {

    public function list($userId, $body) {
        $response = $this->makeRequest("users/{$userId}/open_channels", 'GET', $body)->body;
        $channels = collect($response["channels"]);

        return Channel::collection($channels)->resolve();
    }

    public function store($body) {
        $response = $this->makeRequest('open_channels', 'POST', $body)->body;
        return Channel::make(collect($response))->resolve();
    }

    public function update($body, $url) {
        $response = $this->makeRequest("open_channels/$url", "PUT", $body)->body;

        return Channel::make(collect($response))->resolve();
    }

    public function delete($url) {
        return $this->makeRequest("open_channels/$url", "DELETE")->statusCode;
    }

    public function join($url, $body) {
        return $this->makeRequest("open_channels/$url/join", "PUT", $body)->statusCode;
    }

    public function invite($url, $body) {
        $response = $this->makeRequest("open_channels/$url/invite", "POST", $body)->body;

        return Channel::make(collect($response))->resolve();
    }

}
