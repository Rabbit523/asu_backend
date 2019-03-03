<?php

use Faker\Generator as Faker;

use App\Post;

$factory->define(Post::class, function ($faker) {
    return [
        'title' => $faker->sentence,
        'body' => "<p>{$faker->sentence}</p>",
    ];
});