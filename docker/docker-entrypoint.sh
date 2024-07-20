#!/bin/bash

prepare_environment() {
    prev_path=`pwd`
    echo """
    *************************************
       Preparing Development environment
             Install django-apps
    *************************************
    """
    cd "/usr/src/django-corp-common"
    python setup.py develop

    cd "/usr/src/django-corp-results"
    python setup.py develop

    cd "/usr/src/django-corp-home"
    python setup.py develop

    cd "/usr/src/django-corp-hotels"
    python setup.py develop

    cd "/usr/src/django-corp-users"
    python setup.py develop

    cd "/usr/src/roomdi.commons"
    python setup.py develop

    cd $prev_path
    echo $prev_path
    unset prev_path
}

cd "/usr/src/app/src"

case "$1" in
    dev)
        echo "Running Development server"
        # prepare_environment
        # exec python manage.py runserver 0.0.0.0:8080 &
        exec python -m gunicorn mysite.asgi:application -k uvicorn.workers.UvicornWorker
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
