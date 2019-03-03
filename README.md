# ASU Community App Backend

* Laravel 5.5

`php artisan migrate`

`php artisan db:seed` has a bunch of test data. Probably don't need all of this on production.

`php artisan passport:client --password` - put this in .env under `PASSWORD_CLIENT_ID` and `PASSWORD_CLIENT_SECRET`

`php artisan passport:keys`

# Tests

This app does have some tests. Run using `php artisan dusk`.

If you're getting a database error on these run `touch database/asu_community.sqlite` to create the database file.
