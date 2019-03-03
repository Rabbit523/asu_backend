<?php

use Illuminate\Database\Seeder;

use App\Post;

class PostTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $posts = Post::take(5);
        $posts->each(function ($post) {
            $post->ban([
                'created_by_id' => rand(22, 41)
            ]);
        });
    }
}
