#!/usr/bin/env bash

declare -a specials=("beta.einfracentral.eu" "dl068.madgik.di.uoa.gr" "localhost")

source=${1}
target=${2}

force=false
if [[ -v specials[${target}] ]]; then
    read -p "WARNING: Sure you want to overwrite from ${source} to ${target}? (yes/no)"
    if [[ $REPLY = "yes" ]]; then
        force=true
    fi
fi

if [ "$force" = true ]; then
    cd ../eic-data/exports/
    ./dumpJasons.sh ${source}
    ./convertJasonsToXmls.js
    ./postXmls.sh ${target}
fi
