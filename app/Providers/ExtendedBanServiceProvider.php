<?php

namespace App\Providers;

use App\Observers\BanObserver;
use Illuminate\Support\ServiceProvider;
use Cog\Contracts\Ban\Ban as BanContract;
use Cog\Laravel\Ban\Providers\BanServiceProvider;

class ExtendedBanServiceProvider extends BanServiceProvider
{

    /**
     * Register Ban's models observers.
     *
     * @return void
     */
    protected function registerObservers()
    {
        $this->app->make(BanContract::class)->observe(new BanObserver);
    }
}
