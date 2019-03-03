<?php

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;

use App\User;

class PermissionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
      $permissions = json_decode(File::get("database/fixtures/permissions.json"), true);
      Permission::insert($permissions);
    }
}
