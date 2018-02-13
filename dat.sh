#!/usr/bin/env bash

dat=./`basename "$0"`

case $1 in
    add)
        case $2 in
            types)
                cd ../eic-registry/src/main/resources/resourceTypes
                ./loadResourceTypes.sh localhost
                ./beep.sh "Finished adding types"
            ;;
            resources)
                cd ../eic-data
                ./loadResources.sh localhost
                ./beep.sh "Finished adding resources"
            ;;
            *)
                ${dat} add types
                ${dat} add resources
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
                ${dat} del types
                ${dat} del resources
            ;;
        esac
    ;;
esac
