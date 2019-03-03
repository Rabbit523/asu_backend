<?php

use Illuminate\Database\Seeder;

use App\Role;
use App\Permission;

class RoleTableSeeder extends Seeder
{
    const DEFAULT_MODULES_ADMIN = ["feed", "user.index"];

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $roles = json_decode(File::get("database/fixtures/roles.json"), true);
        Role::insert($roles);
        
        // Super Admin Role
        $super_admin = Role::where("name", Role::SUPER_ADMIN_TYPE)->first();
        $permissions = Permission::all();
        $super_admin->givePermissionTo($permissions);

        // Admin Role
        $admin = Role::where("name", Role::ADMIN_TYPE)->first();
        $permissions = array_map(function($module) {
            return Permission::where([["name", "LIKE", "%${module}%"]])->get();
        }, self::DEFAULT_MODULES_ADMIN);

        $admin->syncPermissions($permissions);
        
    }
}
