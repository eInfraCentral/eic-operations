#!/usr/bin/env bash

case $1 in
    add)
        case $2 in
            types)
                cd ../eic-registry/src/main/resources/resourceTypes
                ./loadResourceTypes.sh localhost
            ;;
            resources)
                cd ../eic-data
                ./loadResources.sh localhost
            ;;
            *)
                ./dat.sh add types
                ./dat.sh add resources
            ;;
        esac
    ;;
    del)
        case $2 in
            types)
                curl -X "DELETE" http://localhost:9200/resourceTypes
            ;;
            resources)
                psql -hlocalhost -Uvrasidas registry -c 'drop owned by vrasidas cascade;'
            ;;
            *)
                ./dat.sh del types
                ./dat.sh del resources
            ;;
        esac
    ;;
esac
