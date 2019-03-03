<?php

namespace Tests\Browser;

use Artisan;
use Tests\DuskTestCase;
use Laravel\Dusk\Browser;
use Illuminate\Support\Facades\Mail;

use App\User;
use App\Mail\WelcomeMail;

/**
 * Class DatatablesTest
 * @package Tests\Browser
 * @group datatables
 */
class AdministratorsTest extends DuskTestCase 
{

    protected $userToLogin, $userToSee, $userNextPage;

    /**
     * Temporal solution for cleaning up session
     */
    protected function setUp() {
        parent::setUp();
        
        foreach (static::$browsers as $browser) {
            $browser->driver->manage()->deleteAllCookies();
            $browser->script('localStorage.clear()');
        }

        $this->userToLogin = User::first();
        $this->userToSee = User::skip(1)->first();
        $this->userNextPage = User::skip(10)->first();
    }
        
    /**
     * @test 
    */
    public function datatablesCheckLoad() {
        $this->browse(function ($browser) {
        	$browser->loginAs($this->userToLogin)
	            ->visit(route('dashboard.admin.index'))
			    ->waitForText('Next')
		        ->with('.table', function ($table)
		        {
			        $table->assertSee($this->userToSee->email);
		        });
        });
    }
    
    /**
     * @test 
    */
    public function datatablesPaginate() {
        $this->browse(function ($browser) {
            $browser->loginAs($this->userToLogin)
                ->visit(route('dashboard.admin.index'))
                ->pause(1000)
                ->with('.table', function ($table) {
                    $table->assertSee($this->userToSee->email);
                })
                ->assertSee('Next')
                ->clickLink('Next')
                ->pause(1000)
                ->with('.table', function ($table) {
                    $table->assertSee($this->userNextPage->email);
                });
        });
    }
    
    /**
     * @test 
    */
    public function datatablesSearchable() {
        $this->browse(function ($browser) {   
            $browser->loginAs($this->userToLogin)
                ->visit(route('dashboard.admin.index'))
                ->pause(1000)
                ->with('.table', function ($table) {
                    $table->assertDontSee($this->userNextPage->email);
                })
                ->type('input[type=search]', $this->userNextPage->name)
                ->pause(1000)
                ->with('.table', function ($table) {
                    $table->assertSee($this->userNextPage->email);
                });
        });
    }

    /**
     * @test 
    */
    public function canCreateAdminUser() {
        Mail::fake();

        $user = factory(User::class, 'admin')->make();

        $this->browse(function ($browser) use($user) {   
            $browser->loginAs($this->userToLogin)
                ->visit(route('dashboard.admin.index'))
                ->pause(1000)
                ->click('@create-button')
                ->pause(1000)
                ->assertSee('New Admin')
                ->type('name', $user->name)
                ->type('email', $user->email)
                ->type('password', 'secret')
                ->type('password_confirmation', 'secret')
                ->select('role', 2)
                ->click('@create-submit')
                ->pause(3000)
                ->assertSee(trans('messages.created'));
        });
    }

    /**
     * @test 
    */
    public function displaysValidationErrors() {
        
        $user = factory(User::class, 'admin')->make();

        $this->browse(function ($browser) use($user) {   
            $browser->loginAs($this->userToLogin)
                ->visit(route('dashboard.admin.index'))
                ->pause(1000)
                ->click('@create-button')
                ->pause(1000)
                ->assertSee('New Admin')
                ->type('name', $user->name)
                ->type('email', $user->email)
                ->type('password', 'secret')
                ->type('password_confirmation', 'secret')
                ->select('role', 2)
                ->clear('name')
                ->click('@create-submit')
                ->pause(3000)
                ->assertDontSee('The email field is required.')
                ->assertSee('The name field is required.');
        });
    }
    
    /**
     * @test 
    */
    public function canDeleteAnAdminUser() {
        $userToDelete = User::skip(1)->first();
        
        $this->browse(function ($browser) use($userToDelete) {   
            $browser->loginAs($this->userToLogin)
                ->visit(route('dashboard.admin.index'))
                ->pause(1000)
                ->with('.table', function ($table) use ($userToDelete)
                {
                    $table
                        ->assertSee($userToDelete->email)
                        ->click('@delete-button');
                })
                ->pause(1000)
                ->assertSee(trans('messages.confirm_dialog.title'))
                ->click('.swal-button--confirm')
                ->pause(3000)
                ->assertSee(trans('messages.deleted'))
                ->assertDontSee($userToDelete->email);;
        });
    }
    
}

