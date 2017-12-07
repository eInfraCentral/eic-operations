#!/usr/bin/env bash

prod=./`basename "$0"`

case $1 in
    up)
        cd ../eic-platform
        npm run deploy:complete
    ;;
    down)
        docker stop eic-platform
    ;;
    restart)
        ${prod} down
        ${prod} up
    ;;
    log)
        docker logs eic-platform -f
    ;;
esac
