#!/bin/bash

# Clear cache - this is essential once we mount the EFS volume
cd /var/www && php flarum cache:clear

chmod -R 777 /var/www/public/assets

# Symlink fonts
# ln -sF /var/www/vendor/components/font-awesome/webfonts /var/www/public/assets/fonts

chmod -R 777 /var/www/storage
chmod -R 775 /var/www

# Make the environment variables available for cron
printenv | grep -v "no_proxy" >> /etc/environment

service cron start

apache2-foreground
