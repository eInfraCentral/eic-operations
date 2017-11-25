#!/usr/bin/env bash

case $1 in
    up)
        cd ../eic-platform
        npm run deploy:complete
    ;;
    down)
        docker stop eic-platform
    ;;
    log)
        docker logs eic-platform -f
    ;;
esac
