#!/usr/bin/env bash

host=vereniki.athenarc.gr
ip=$(dig +short ${host})
anal=./`basename "$0"`
ymlDir=../eic-analytics

case $1 in
    up)
        docker-compose -f ${ymlDir} up -d -build
    ;;
    down)
        cd ../eic-analytics
        docker-compose -f ${ymlDir} down
    ;;
    restart)
        ${anal} down
        ${anal} up
    ;;
    setup)
        cd ../eic-analytics
        MYSQL_ROOT_PASSWORD=PASSWORD docker-compose -f ${ymlDir} up -d --build
    ;;
esac
