#!/bin/bash


echo '# ----------------------------------------------------------------------'
echo '# Run Composer Started'
echo '# ----------------------------------------------------------------------'

cd /app
composer install --ignore-platform-reqs
composer dump-autoload


echo '# ----------------------------------------------------------------------'
echo '# Composer Installation Finished'
echo '# ----------------------------------------------------------------------'