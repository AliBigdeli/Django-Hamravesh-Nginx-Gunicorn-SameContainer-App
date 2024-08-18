#!/bin/bash

echo "Makeing the migrations"
python manage.py migrate

echo "Collecting statics"
python manage.py collectstatic --no-input

echo "stating wsgi gunicorn server"
gunicorn core.wsgi:application --bind "0.0.0.0:8000" --daemon


echo "starting nginx server"
nginx -g 'daemon off;'