<?php

namespace Tests\Browser;

use Tests\DuskTestCase;
use Laravel\Dusk\Browser;
use Illuminate\Support\Facades\Notification;
use Illuminate\Auth\Notifications\ResetPassword;

use App\User;

class AuthTest extends DuskTestCase
{
    protected $user;
    
    public function setUp() {
        parent::setUp();
        $this->user = User::find(1);
    }

    /**
    * @test
    */
    public function isLoginPage()
    {
        $this->browse(function ($browser) {
            $browser
                ->visit(route('login'))
	            ->assertTitle('A-State')
                ->assertSee('I forgot my password');
        });
    }

    /**
    * @test
    */
    public function login() {
    	$this->browse(function($browser) {
            $browser
                ->loginAs($this->user->id)
                ->visit(route('dashboard.home'))
                ->assertSee('You are logged in!')
                ->logout();
        });
    }

    /**
    * @test
    */
    public function isResetPasswordPage() {
        $this->browse(function ($browser) {
            $browser
                ->visit(route('password.reset'))
	            ->assertTitle('A-State')
                ->assertSee('Reset Password');
        });
    }

    /**
    * @test
    */
    public function isResetPasswordFormPage() {
        $this->browse(function ($browser) {
            $browser
                ->visit(route('password.reset', 'token'))
	            ->assertTitle('A-State')
                ->assertSee('Reset Password');
        });
    }
}
