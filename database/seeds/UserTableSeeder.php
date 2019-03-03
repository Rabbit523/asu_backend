<?php

use Carbon\Carbon;
use Illuminate\Database\Seeder;

use App\Role;
use App\User;
use App\Post;
use App\Event;

class UserTableSeeder extends Seeder
{
  public function run()
  { 
    // Super Admin User
    $super_admin_role = Role::where('name', Role::SUPER_ADMIN_TYPE)->first();
    $user = factory(User::class, 'admin', 1)->create()->each(function ($user) use($super_admin_role) {
      $user->assignRole($super_admin_role);
    });
    
    // Admin Users
    $admin_role = Role::where('name', Role::ADMIN_TYPE)->first();
    factory(User::class, 'admin', 20)->create()->each(function ($user) use($admin_role) {
        $user->assignRole($admin_role);
        $user->posts()->save(factory(Post::class)->make());
    });

    // Common Users
    $user_role = Role::where('name', Role::APP_ROLES[rand(0,1)])->first();
    factory(User::class, 'user', 20)->create()->each(function ($user) use($user_role) {
        $event = Event::find(rand(1, 20));
        $user->events()->save($event, ['followed_at' => Carbon::now()->toDateTimeString()]);

        $user->assignRole($user_role);
    });
  }
}
