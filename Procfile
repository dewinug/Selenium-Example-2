release: python manage.py collectstatic --noinput
release: python manage.py migrate
web: gunicorn myshop.wsgi:application --log-file -
