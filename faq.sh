#!/usr/bin/env bash

cd ../eic-platform/UnderMaintenance/

maint=../eic-platform/UnderMaintenance/

case $1 in
    on)
        pwd
        cp ../eic-platform/UnderMaintenance/underMaintenance.html ../eic-platform/UnderMaintenance/index.html
    ;;
    off)
        rm ../eic-platform/UnderMaintenance/index.html
    ;;
esac
