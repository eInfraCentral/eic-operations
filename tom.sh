#!/usr/bin/env bash

case $1 in
    up)
        cd ../eic-docker
        docker-compose up -d --build
        while read line; do
            if [[ ${line} =~ "INFO: Server startup in" ]] ; then
                break;
            fi
        done < <(docker logs tomcat -f 2>&1)
    ;;
    down)
        cd ../eic-docker
        docker-compose down
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
