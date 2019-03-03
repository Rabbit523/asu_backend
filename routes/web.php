<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Authentication Routes...
$this->get('login', 'Auth\LoginController@showLoginForm')->name('login');
$this->post('login', 'Auth\LoginController@login')->name('login');
$this->get('logout', 'Auth\LoginController@logout')->name('logout');
$this->post('logout', 'Auth\LoginController@logout')->name('logout');

// Password Reset Routes...
Route::get('password/reset', 'Auth\ForgotPasswordController@showLinkRequestForm')->name('password.reset');
Route::post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail')->name('password.email');
Route::get('password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name('password.reset.token');
Route::post('password/reset', 'Auth\ResetPasswordController@reset');

Route::group(['middleware' => ['auth']], function() {
    Route::get('/', function () { return redirect(route('dashboard.home')); });

    Route::group(['prefix' => 'dashboard', 'as' => 'dashboard.', 'namespace' => 'Dashboard'], function () {
        Route::get('/home', 'HomeController@index')->name('home');

        Route::group(['middleware' => ['role:super-admin|admin']], function () {
            Route::get('user', 'UserController@index')->name('user.index');
            Route::get('user/block/{user}', 'UserController@block')->name('user.block');
            Route::post('user/password/reset', 'UserController@passwordReset')->name('user.password-reset');
            Route::delete('user/{user}', 'UserController@destroy')->name('user.destroy');

            Route::get('complaint', 'ComplaintController@index')->name('complaint.index');
            Route::get('complaint/user/{id}', 'ComplaintController@showUser')->name('complaint.show-user');
            Route::post('complaint/content/{id}', 'ComplaintController@showContent')->name('complaint.show-content');

            Route::resource('feed', 'SocialMediaFeedController', ['except' => ['show', 'create', 'edit']]);
            Route::resource('event', 'EventController', ['except' => ['create', 'edit']]);
            Route::resource('job', 'JobController', ['except' => ['create', 'edit']]);
            Route::resource('category', 'CategoryController', ['except' => ['create', 'edit']]);
            Route::resource('channel', 'ChannelController', ['except' => ['create', 'edit']]);

            Route::resource('tag', 'TagController', ['only' => ['index', 'store', 'update', 'destroy']]);
            Route::get('tag/filter', 'TagController@filter')->name('tag.filter');
            Route::get('tag/filter/category', 'TagController@filterByCategory')->name('tag.filter-by-category');
        });

        Route::group(['middleware' => ['role:super-admin']], function () {
            Route::resource('admin', 'AdminController', ['only' => ['index', 'store', 'destroy']]);
        });
    });
});
