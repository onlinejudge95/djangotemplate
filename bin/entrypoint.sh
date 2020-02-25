#!/bin/sh
echo "Performing migrations..."

python manage.py makemigrations
python manage.py migrate

echo "Migrations done..."


echo "Starting server..."

gunicorn --bind 0.0.0.0:8000 djangotemplate.wsgi:application --log-file=- --log-config conf/gunicorn.conf

echo "Server shut down..."
