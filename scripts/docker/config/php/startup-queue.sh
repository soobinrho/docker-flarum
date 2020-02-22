#!/bin/bash

echo "Starting Redis Queue Processor"

apache2-foreground & php /var/www/flarum queue:work
