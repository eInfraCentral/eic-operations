#!/usr/bin/env bash

tom=./`basename "$0"`

case $1 in
    up)
        cd ../eic-docker
        docker-compose up -d --build
    ;;
    down)
        cd ../eic-docker
        docker-compose down
    ;;
    restart)
        ${tom} down
        ${tom} up
        ${tom} wait
        ./beep.sh "Finished restarting backend"
    ;;
    wait)
        while read line; do
            if [[ ${line} =~ "Server startup in" ]] ; then
                break;
            fi
        done < <(docker logs tomcat -f 2>&1)
    ;;
    log)
        docker logs tomcat -f
    ;;
    build)
        ./mvn.sh clean install package
    ;;
    pull)
        ./git.sh pull
    ;;
esac
