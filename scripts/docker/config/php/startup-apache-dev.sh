#!/bin/bash

# Workaround for permissions issues running the docker images on Ubuntu
usermod -u 1000 www-data

cd /var/www

# Clear cache
php flarum cache:clear

# We will also need to add the running of migrations here
php flarum migrate

# Publish the assets (fonts, js, etc)
php flarum assets:publish

# Make the environment variables available for cron
printenv | grep -v "no_proxy" >> /etc/environment

service cron start

apache2-foreground
