<?php

namespace Tests\Browser;

use Tests\DuskTestCase;
use Laravel\Dusk\Browser;
use Illuminate\Foundation\Testing\DatabaseMigrations;

use App\User;
use App\Role;

class RolesTest extends DuskTestCase
{
    protected $user;

    /**
     * Temporal solution for cleaning up session
     */
    protected function setUp() {
        parent::setUp();

        $this->user = factory(User::class, 'admin')->create();
    }

    /**
     * @test 
    */
    public function isSuperAdmin()
    {
        $this->user->syncRoles([Role::SUPER_ADMIN_TYPE]);

        $this->browse(function (Browser $browser) {
            $browser->loginAs($this->user)
                ->visit(route('dashboard.home'))
                ->assertSee("Administrators")
                ->logout();
        });
    }

    /**
     * @test 
    */
    public function isAdmin()
    {
        $this->user->syncRoles([Role::ADMIN_TYPE]);

        $this->browse(function (Browser $browser) {
            $browser->loginAs($this->user)
                ->visit(route('dashboard.home'))
                ->assertSee("Social Media Feeds")
                ->assertDontSee("Administrators")
                ->logout();
        });
    }
}
