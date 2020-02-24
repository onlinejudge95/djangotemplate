#!/bin/sh
echo "Performing migrations..."

python manage.py makemigrations
python manage.py migrate

echo "Migrations done..."


echo "Starting server..."

python manage.py runserver 0.0.0.0:8000

echo "Server shut down..."
