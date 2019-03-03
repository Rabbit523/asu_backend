<?php

namespace App\SendBird;

use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;

class SendBirdApiClient {

	protected $client;

	function __construct()
	{
		$this->client = new Client(
            [
                'headers' => [
                    'Content-Type'=> 'application/json, charset=utf8',
                    'Api-Token'=>    config('sendbird.api_token')
                ]
            ]);
	}

	public function makeRequest($uri, $method = 'GET', $body = [])
	{
		$response = new class{};

		$params = strcmp($method, "GET") ? "" : $this->buildQuery($body);

		try {
	     	$request = $this->client->request(
                    $method,
                    "{$this->buildUrl($uri)}?$params",
                    $this->encodeBody($body)
				  );

	        $response->statusCode = $request->getStatusCode();
			$response->body = json_decode($request->getBody(), true);

	        return $response;

    	} catch (RequestException $e) {
        	$response->statusCode = $e->getResponse()->getStatusCode();
			$responseData = json_decode($e->getResponse()->getBody(), true);
			if(isset($responseData->errors)){
				$response->body = $responseData->errors;
			}
			else{
				$response->body = $responseData;
			}

       		return $response;
    	}
    }

    public function buildUrl($uri){
		return config('sendbird.url').$uri;
	}

	function buildQuery(array $array) {
		$parts = array();
		foreach ($array as $key => $value) {
			$parts[] = urlencode($key).'='.(is_bool($value)?($value?'true':'false'):urlencode($value));
		}
		return implode('&', $parts);
	}

	public function encodeBody($body) {
		return [
			'body' => json_encode($body)
		];
	}
}
