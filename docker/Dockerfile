FROM python:3.8

RUN mkdir -p /usr/src/app/requirements
RUN mkdir -p /usr/src/logs

WORKDIR /usr/src/app

COPY requirements/requirements.txt /usr/src/app/requirements/
COPY requirements/django_apps.txt /usr/src/app/requirements/

RUN pip install --no-cache-dir r requirements/requirements.txt

ADD . /usr/src/app

EXPOSE 8080

WORKDIR /usr/src/app

ENTRYPOINT ["/usr/src/app/docker/docker-entrypoint.sh"]
