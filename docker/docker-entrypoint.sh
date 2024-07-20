#!/bin/bash

cd "/usr/src/app/src"

case "$1" in
    dev)
        echo "Running Development server"
        # exec python manage.py runserver 0.0.0.0:8080 &
        exec python -m gunicorn mysite.asgi:application -k uvicorn.workers.UvicornWorker &
        sleep 10
        tail -f ../../logs/*
    ;;
    bash)
        /bin/bash "${@:2}"
    ;;
    manage)
        python manage.py "${@:2}"
    ;;
    shell)
        python manage.py shell
    ;;
esac
