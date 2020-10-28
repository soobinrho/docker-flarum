#!/bin/bash

chmod -R 777 /var/www

cd /var/www

# Clear cache
php flarum cache:clear

# We will also need to add the running of migrations here
php flarum migrate

# Make the environment variables available for cron
printenv | grep -v "no_proxy" >> /etc/environment

service cron start

apache2-foreground
