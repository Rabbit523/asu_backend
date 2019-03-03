<?php

use Faker\Generator as Faker;

use App\Job;

$factory->define(Job::class, function ($faker) {return [
        'title' => $faker->jobTitle,
        'description' => $faker->realText(rand(100,200)),
        'city' => $faker->city,
        'state' => $faker->state,
        'zip_code' => $faker->postcode,
        'company' => $faker->company,
        'url' => $faker->url,
    ];
});