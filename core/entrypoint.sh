#!/bin/bash

python manage.py collectstatic --no-input

gunicorn core.wsgi:application --bind "0.0.0.0:8000" --daemon

nginx -g 'daemon off;'