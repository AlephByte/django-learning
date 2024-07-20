FROM python:3.8

RUN mkdir -p /usr/src/app/requirements
RUN mkdir -p /usr/src/logs

WORKDIR /usr/src/app

COPY requirements/requirements.txt /usr/src/app/requirements/
RUN pip install --no-cache-dir -r requirements/requirements.txt

ADD . /usr/src/app

EXPOSE 9000

WORKDIR /usr/src/app/src

RUN python -m gunicorn --bind 0.0.0.0:9000 mysite.asgi:application -k uvicorn.workers.UvicornWorker &
RUN sleep 10

# ENTRYPOINT ["/usr/src/app/docker/docker-entrypoint.sh"]
