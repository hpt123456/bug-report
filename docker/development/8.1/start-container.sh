#!/usr/bin/env bash

set -e
echo '# ----------------------------------------------------------------------'
echo '# Container Started'
echo '# ----------------------------------------------------------------------'
cd /var/www

composer install --ignore-platform-reqs --prefer-dist --no-scripts --no-progress --no-interaction --no-autoloader
composer dump-autoload --optimize
php artisan optimize:clear
php artisan view:cache
php artisan storage:link

echo '# ----------------------------------------------------------------------'
echo '# Container Finished'
echo '# ----------------------------------------------------------------------'

exec "$@"