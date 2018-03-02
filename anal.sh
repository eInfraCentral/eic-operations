#!/usr/bin/env bash

host=vereniki.athenarc.gr
ip=$(dig +short ${host})
anal=./`basename "$0"`
orig=$(pwd)
dir="${orig}/../eic-analytics"

case $1 in
    up)
        cd ${dir}
        docker-compose up -d --build
        cd ${orig}
    ;;
    down)
        cd ${dir}
        docker-compose down
        cd ${orig}
    ;;
    restart)
        ${anal} down
        ${anal} up
    ;;
    setup)
        MYSQL_ROOT_PASSWORD=$2 ${anal} up
    ;;
esac
