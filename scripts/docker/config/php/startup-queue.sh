#!/bin/bash

chmod -R 777 /var/www/storage

echo "Starting Redis Queue Processor"

apache2-foreground & php /var/www/flarum queue:work
