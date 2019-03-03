<?php

namespace App\Http;

use Carbon\Carbon;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Request;
use App\Exceptions\Users\UserNotFoundException;
use App\Exceptions\Users\InvalidCredentialsException;

use App\User;

class LoginProxy
{
    const REFRESH_TOKEN = 'refreshToken';

    private $app;

    private $auth;

    private $cookie;

    private $db;

    private $request;

    public function __construct(Application $app) {
        $this->app = $app->make('app');
        $this->auth = $app->make('auth');
        $this->cookie = $app->make('cookie');
        $this->db = $app->make('db');
        $this->request = $app->make('request');
    }

    /**
     * Attempt to create an access token using user credentials
     *
     * @param string $email
     * @param string $password
     */
    public function attemptLogin($request)
    {
        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            return $this->proxy('password', [
                'username' => $credentials['email'],
                'password' => $credentials['password']
            ]);
        }

        throw new InvalidCredentialsException('invalid_credentials');
    }

    /**
     * Attempt to refresh the access token used a refresh token that
     * has been saved in a cookie
     */
    public function attemptRefresh()
    {
        $refreshToken = $this->request->cookie(self::REFRESH_TOKEN);

        return $this->proxy('refresh_token', [
            'refresh_token' => $refreshToken
        ]);
    }

    /**
     * Proxy a request to the OAuth server.
     *
     * @param string $grantType what type of grant type should be proxied
     * @param array $data the data to send to the server
     */
    public function proxy($grantType, array $data = [])
    {
        $data = array_merge($data, [
            'client_id'     => config('auth.login_proxy.client_id'),
            'client_secret' => config('auth.login_proxy.client_secret'),
            'grant_type'    => $grantType
        ]);

        // Create request
         $request = Request::create('oauth/token', 'POST', $data, [], [], [
            'HTTP_Accept'             => 'application/json',
        ]);

        // Get response
        $response = $this->app->handle($request);

        $authResult = json_decode($response->getContent(), true);
        $this->setCookie($authResult['refresh_token']);

        return [
            'user' => request()->user(),
            'access_token' => $authResult['access_token'],
            'expires_in' => Carbon::now()->addSeconds($authResult['expires_in'])->format('Y-m-d H:i:s')
        ];
    }

    /**
     * Create a refresh token cookie
     *
     * @param string $refreshToken
     */
    protected function setCookie($refreshToken) {
        $this->cookie->queue(
            self::REFRESH_TOKEN,
            $refreshToken,
            864000, // 10 days
            null,
            null,
            false,
            true // HttpOnly
        );
    }

    /**
     * Logs out the user. We revoke access token and refresh token.
     * Also instruct the client to forget the refresh cookie.
     */
    public function logout()
    {
        $accessToken = $this->auth->user()->token();

        $refreshToken = $this->db
            ->table('oauth_refresh_tokens')
            ->where('access_token_id', $accessToken->id)
            ->update([
                'revoked' => true
            ]);

        $accessToken->revoke();

        $this->cookie->queue($this->cookie->forget(self::REFRESH_TOKEN));
    }
}
