<?php

namespace App\SendBird;

use App\Http\Resources\SendBird\Channel;
use App\Http\Resources\SendBird\ChannelCollection;

class ChannelClient extends SendBirdApiClient {

    public function list($userId, $body) {
        $response = $this->makeRequest("users/{$userId}/my_group_channels", 'GET', $body)->body;
        $channels = collect($response["channels"]);

        return Channel::collection($channels)->resolve();
    }

    public function store($body) {
        $response = $this->makeRequest('group_channels', 'POST', $body)->body;

        return Channel::make(collect($response))->resolve();
    }

    public function update($body, $url) {
        $response = $this->makeRequest("group_channels/$url", "PUT", $body)->body;

        return Channel::make(collect($response))->resolve();
    }

    public function delete($url) {
        return $this->makeRequest("group_channels/$url", "DELETE")->statusCode;
    }

    public function join($url, $body) {
        return $this->makeRequest("group_channels/$url/join", "PUT", $body)->statusCode;
    }

    public function invite($url, $body) {
        $response = $this->makeRequest("group_channels/$url/invite", "POST", $body)->body;

        return Channel::make(collect($response))->resolve();
    }

}
