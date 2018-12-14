# security-scorecard-online-store

> Django project

## Build Setup
Tested on ubuntu 18, Python 3.6.7

### initial setup

``` bash
$ sudo apt install redis-server
$ pip install requirement

$ apt-get update && apt-get install -y \
    software-properties-common \
    python-pip \
    xauth \
    unzip \
    wget \
    libxss1 \
    libappindicator1 \
    libindicator7 \
    redis-server \
    xvfb \
$  wget -q "https://chromedriver.storage.googleapis.com/2.35/chromedriver_linux64.zip"
$  unzip chromedriver_linux64.zip
$  mv chromedriver /usr/bin/chromedriver
$  chown $USER:$USER /usr/bin/chromedriver
$  chmod +x /usr/bin/chromedriver
$  rm -rf chromedriver_linux64.zip


$  python manage.py makemigrations
$  python manage.py migrate
$  python manage.py createsuperuser   #follow the prompt and create super user with credential admin/admin
$  python manage.py runserver

#login at localhost:8000/admin with credentials admin/admin

```

## Test
from project directory run
`robot -d rf_test/reports rf_test/test`

**Note**: this test will run in headless mode if you need browser test comment out line 18 in the keyword file

Deployment and test execution are on gitlab ci




