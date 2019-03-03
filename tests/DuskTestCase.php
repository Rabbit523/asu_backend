<?php

namespace Tests;

use App\Console\Kernel;
use Laravel\Dusk\TestCase as BaseTestCase;
use Facebook\WebDriver\Chrome\ChromeOptions;
use Facebook\WebDriver\Remote\RemoteWebDriver;
use Facebook\WebDriver\Remote\DesiredCapabilities;
use Facebook\WebDriver\Remote\WebDriverCapabilityType;

abstract class DuskTestCase extends BaseTestCase
{
    use CreatesApplication;

    /**
     * Prepare for Dusk test execution.
     *
     * @beforeClass
     * @return void
     */
    public static function prepare()
    {
        static::startChromeDriver();
    }

    /**
     * Create a fresh database instance before each test class is initialized. This is different
     * than the default DatabaseMigrations as it is only run when the class is setup. The trait
     * provided by Laravel will run on EACH test function, slowing things down significantly.
     *
     * If you need to reset the DB between function runs just include the trait in that specific
     * test. In most cases you probably wont need to do this, or can modify the test slightly to
     * avoid the need to do so.
     */
    public static function setUpBeforeClass()
    {
        parent::setUpBeforeClass();

        $app = require __DIR__ . '/../bootstrap/app.php';
        $kernel = $app->make(Kernel::class);
        $kernel->bootstrap();

        $kernel->call('config:clear');
        $kernel->call('cache:clear');
        $kernel->call('config:cache');
        $kernel->call('migrate:refresh');
        $kernel->call('db:seed');
    }

    /**
     * Create the RemoteWebDriver instance.
     *
     * @return \Facebook\WebDriver\Remote\RemoteWebDriver
     */
    // protected function driver()
    // {
    //     $capabilities = DesiredCapabilities::chrome();
    //     $chromeOptions = (new ChromeOptions())->addArguments(['headless', 'disable-gpu', 'no-sandbox', 'ignore-certificate-errors']);
    //     $capabilities->setCapability(ChromeOptions::CAPABILITY, $chromeOptions);
    //     $capabilities->setCapability(WebDriverCapabilityType::ACCEPT_SSL_CERTS, true);
    //     $capabilities->setCapability('acceptInsecureCerts', true);
    //
    //     return RemoteWebDriver::create(
    //         'http://localhost:4444/wd/hub', $capabilities
    //     );
    //
    // }
}
