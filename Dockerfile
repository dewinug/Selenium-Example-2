FROM ubuntu:latest

MAINTAINER Michael Olawepo <sejuba@gmail.com>
LABEL description Robot Framework in Docker.

# Setup volumes for input and output
VOLUME /opt/robotframework/reports
VOLUME /opt/robotframework/tests

# Setup X Window Virtual Framebuffer
ENV SCREEN_COLOUR_DEPTH 24
ENV SCREEN_HEIGHT 1080
ENV SCREEN_WIDTH 1920
ENV BROWSER chrome

# Set number of threads for parallel execution
# By default, no parallelisation
ENV ROBOT_THREADS 1

# Dependency versions
ENV CHROMIUM_VERSION 70.0.*
ENV FAKER_VERSION 4.2.0
ENV FIREFOX_VERSION 63.0*
ENV GECKO_DRIVER_VERSION v0.22.0
ENV PABOT_VERSION 0.45
ENV PYTHON_PIP_VERSION 18.0*
ENV REQUESTS_VERSION 0.4.7
ENV ROBOT_FRAMEWORK_VERSION 3.0.4
ENV SELENIUM_LIBRARY_VERSION 3.2.0
ENV XVFB_VERSION 1.2.2

# Install system dependencies
RUN apt-get update && apt-get install -y \
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
  && apt-get clean all


# install chrome browser
#RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> "/etc/apt/sources.list.d/google-chrome.list"
#RUN wget https://dl.google.com/linux/linux_signing_key.pub
#RUN apt-key add linux_signing_key.pub
#RUN apt install google-chrome-stable
RUN  wget -q "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
RUN apt-get install -y ./google-chrome*.deb
RUN apt-get install -y xvfb

# Install Robot Framework and Selenium Library
RUN pip install \
  robotframework==$ROBOT_FRAMEWORK_VERSION \
  robotframework-faker==$FAKER_VERSION \
  robotframework-pabot==$PABOT_VERSION \
  robotframework-requests==$REQUESTS_VERSION \
  robotframework-seleniumlibrary==$SELENIUM_LIBRARY_VERSION \
  robotframework-xvfb==$XVFB_VERSION

RUN wget -q "https://chromedriver.storage.googleapis.com/2.35/chromedriver_linux64.zip"
RUN unzip chromedriver_linux64.zip
RUN mv chromedriver /usr/bin/chromedriver
RUN chown $USER:$USER /usr/bin/chromedriver
RUN chmod +x /usr/bin/chromedriver
RUN rm -rf chromedriver_linux64.zip

# Prepare binaries to be executed
ADD rf_test/bin /opt/robotframework/bin
ADD rf_test/resource /opt/robotframework/resource
ADD rf_test/test /opt/robotframework/tests

# Copy porject file
ADD . /opt/app
WORKDIR /opt/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD python manage.py makemigrations
CMD python manage.py migrate
CMD python manage.py runserver

# Update system path
ENV PATH=/opt/robotframework/bin:/opt/robotframework/drivers:$PATH

# Execute all robot tests

CMD ["run-tests-in-virtual-screen.sh"]
