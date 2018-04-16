#!/usr/bin/env bash

anal=./`basename "$0"`

case $1 in
    up)
        cd ../eic-analytics
        docker-compose up -d --build
        cd -
    ;;
    down)
        cd ../eic-analytics
        docker-compose down
        cd -
    ;;
    restart)
        ${anal} down
        ${anal} up
    ;;
    setup)
        docker network create lb_web
        MYSQL_ROOT_PASSWORD=$2 ${anal} up
    ;;
esac
