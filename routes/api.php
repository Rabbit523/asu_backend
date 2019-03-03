<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group([
        'namespace' => 'Api'
    ], function () {

        Route::group([
            'prefix' => 'auth'
        ], function () {
            Route::post('login', 'AuthController@login');
            Route::post('login/refresh', 'AuthController@refresh');
            Route::post('signup', 'AuthController@signup');
            Route::post('password/reset', 'AuthController@sendResetLinkEmail');

            Route::group([
            'middleware' => 'auth:api'
            ], function() {
                Route::get('logout', 'AuthController@logout');
                Route::get('user', 'AuthController@user');
            });
        });

        Route::group([
            'middleware' => 'auth:api'
        ], function() {
            Route::apiResource('profiles', 'ProfileController', ['only' => ['index', 'show', 'update']]);
            Route::put('profiles/{profile}/interests', 'ProfileController@interests');

            Route::apiResource('interests', 'InterestController', ['only' => ['index']]);

            Route::apiResource('categories', 'CategoryController', ['only' => ['index']]);


            Route::apiResource('events', 'EventController', ['only' => ['index', 'show']]);
            Route::get('events/{event}/follow', 'EventController@follow');
            Route::get('events/{event}/unfollow', 'EventController@unfollow');
            Route::get('events/{event}/attendance', 'EventController@attendance');

            Route::apiResource('jobs', 'JobController', ['only' => ['index', 'show']]);

            Route::apiResource('tags', 'TagController', ['only' => ['index']]);

            Route::resource('channels', 'ChannelController', ['only' => ['index', 'show', 'store', 'update']]);
            Route::get('channels/{channel}/join', 'ChannelController@join');
            Route::post('channels/{channel}/invite', 'ChannelController@invite');
        });
});
