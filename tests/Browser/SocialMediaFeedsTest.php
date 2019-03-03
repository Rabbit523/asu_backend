<?php

namespace Tests\Browser;

use Tests\DuskTestCase;
use Laravel\Dusk\Browser;
use Illuminate\Foundation\Testing\WithFaker;

use App\User;
use App\SocialMediaFeed;

class SocialMediaFeedsTest extends DuskTestCase
{
    use WithFaker;

    protected $userToLogin;

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
        \Log::info($this->userToLogin);
    }
        
    /**
     * @test 
    */
    public function datatablesCheckLoad() {
        $this->browse(function ($browser) {
        	$browser->loginAs($this->userToLogin)
	            ->visit(route('dashboard.feed.index'))
			    ->waitForText('Next')
		        ->with('.table', function ($table)
		        {
			        $table->assertSee('No data available in table');
		        });
        });
    }

    /**
     * @test 
    */
    public function canCreateSocialMediaFeed() {
        $this->browse(function ($browser) {   
            $browser->loginAs($this->userToLogin)
                ->visit(route('dashboard.feed.index'))
                ->click('@create-button')
                ->pause(1000)
                ->assertSee(trans('messages.new_feed'))
                ->with('#create-form', function ($form)
		        {
			        $form->type('name', $this->faker->userName);
			        $form->type('url', $this->faker->url);
		        })
                ->click('@create-submit')
                ->pause(3000)
                ->assertSee(trans('messages.created'));
        });
    }

    /**
     * @test 
    */
    public function displaysValidationErrors() {
        $this->browse(function ($browser) {   
            $browser->loginAs($this->userToLogin)
                ->visit(route('dashboard.feed.index'))
                ->click('@create-button')
                ->pause(1000)
                ->assertSee(trans('messages.new_feed'))
                ->with('#create-form', function ($form)
		        {
			        $form->type('name', $this->faker->userName)
			            ->type('url', $this->faker->url)
			            ->clear('url');
		        })
                ->click('@create-submit')
                ->assertSee('The url field is required.')
                ->assertDontSee('The name field is required.');
        });
    }

    /**
     * @test 
    */
    public function canEditSocialMediaFeed() {
        $socialMediaFeed = SocialMediaFeed::first();
        
        $this->browse(function ($browser) use($socialMediaFeed) {   
            $browser->loginAs($this->userToLogin)
                ->visit(route('dashboard.feed.index'))
                ->pause(1000)
                ->with('.table', function ($table) use ($socialMediaFeed)
                {
                    $table
                        ->assertSee($socialMediaFeed->name)
                        ->click('@edit-button');
                })
                ->pause(1000)
                ->assertSee(trans('messages.edit_feed'))
                ->with('#edit-form', function ($form)
		        {   
			        $form->clear('name')
			            ->type('name', 'Edited Feed');
		        })
                ->click('@edit-submit')
                ->pause(3000)
                ->assertSee(trans('messages.edit'))
                ->with('.table', function ($table) use ($socialMediaFeed)
                {
                    $table
                        ->assertSee($socialMediaFeed->fresh()->name);
                });
        });
    }

    /**
     * @test 
    */
    public function canDeleteASocialMediaFeed() {
        $socialMediaFeed = SocialMediaFeed::first();
        
        $this->browse(function ($browser) use($socialMediaFeed) {   
            $browser->loginAs($this->userToLogin)
                ->visit(route('dashboard.feed.index'))
                ->pause(1000)
                ->with('.table', function ($table) use ($socialMediaFeed)
                {
                    $table
                        ->assertSee($socialMediaFeed->name)
                        ->click('@delete-button');
                })
                ->pause(1000)
                ->assertSee(trans('messages.confirm_dialog.title'))
                ->click('.swal-button--confirm')
                ->pause(3000)
                ->assertSee(trans('messages.deleted'))
                ->assertDontSee($socialMediaFeed->name);
        });
    }
    
    
}


