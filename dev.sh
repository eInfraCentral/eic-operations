#!/usr/bin/env bash

case $1 in
    up)
        cd ../eic-platform
        rm nohup.out
        nohup npm start &
    ;;
    down)
        killall node
    ;;
    log)
        tail -fn +1 ../eic-platform/nohup.out
    ;;
esac
