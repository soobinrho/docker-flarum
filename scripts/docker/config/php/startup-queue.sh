#!/bin/bash

echo "Starting Redis Queue Processor"

php /var/www/flarum queue:work
