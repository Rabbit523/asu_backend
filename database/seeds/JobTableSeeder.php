<?php

use Illuminate\Database\Seeder;

use App\Job;

class JobTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(Job::class, 20)->create();
    
    }
}
