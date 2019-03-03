<?php

use Carbon\Carbon;
use Faker\Generator as Faker;

use App\Event;

$factory->define(Event::class, function ($faker) {
    $startDate = Carbon::now();
    $endDate   = Carbon::now()->addMonths(4);

    $randomDate = Carbon::createFromTimestamp(rand($endDate->timestamp, $startDate->timestamp))->format('Y-m-d');

    return [
        'name' => $faker->domainWord,
        'address' => $faker->streetAddress,
        'city' => $faker->city,
        'state' => $faker->state,
        'zip_code' => $faker->postcode,
        'date' => $randomDate,
        'time' => $faker->time($format = 'H:i:s'),
        'description' => $faker->realText(200),
    ];
});
