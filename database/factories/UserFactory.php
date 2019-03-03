<?php

use Carbon\Carbon; 
use Faker\Generator as Faker;

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| This directory should contain each of the model factory definitions for
| your application. Factories provide a convenient way to generate new
| model instances for testing / seeding your application's database.
|
*/

$factory->defineAs(App\User::class, 'user', function (Faker $faker) {
    return [
        'name' => $faker->name,
        'email' => $faker->unique()->safeEmail,
        'password' => 'secret', 
        'remember_token' => str_random(10),
        'profile' => [
            'student_id' => $faker->randomNumber,
            'major' => $faker->userName,
            'graduation_date' => Carbon::now()->addYears(rand(2, 5))->format('m-d-Y'),
            'location' => $faker->address,
            'status' => $faker->sentence,
        ],
    ];
});

$factory->defineAs(App\User::class, 'admin', function (Faker $faker) {
    return [
        'name' => $faker->name,
        'email' => $faker->unique()->safeEmail,
        'password' => 'secret', 
        'remember_token' => str_random(10)
    ];
});
