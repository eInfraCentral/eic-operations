#!/usr/bin/env bash

declare -a specials=("beta.einfracentral.eu" "dl068.madgik.di.uoa.gr" "localhost")

source=${1}
target=${2}
type=${3}

if [[ -z "$3" ]]; then
    type=elastic
fi

force=1

for i in "${specials[@]}"; do
    if [[ "$i" == "$target" ]] ; then
        force=0
        msg="WARNING: Sure you want to overwrite from ${source} to ${target}? (yes/no)"
        ./beep.sh "$msg"
        read -p "$msg"
        if [[ $REPLY = "yes" ]]; then
            force=1
        fi
    fi
done

if [[ ${force} -eq 1 ]]; then
    cd ../eic-data/exports/
    stamp=$(date +%s)
    sudo mv xmls xmls.${stamp}
    if [[ "$type" == "elastic" ]]; then
        mv elasticJasons elasticJasons.${stamp}
        ./elasticDumpJasons.sh ${source}
        ./elasticConvertJasonsToXmls.js
        msg="WARNING: You're about to upload from ${source} to ${target}. Please say ok when you're done making manual changes."
        ./beep.sh "$msg"
        read -p "$msg"
        if [[ $REPLY = "ok" ]]; then
            ./elasticPostXmls.sh ${target}
        fi
    fi
    if [[ "$type" == "core" ]]; then
        mv jsons jsons.${stamp}
        ./coreDumpJasons.sh ${source}
        ./coreConvertJasonsToXmls.js
        msg="WARNING: You're about to upload from ${source} to ${target}. Please say ok when you're done making manual changes."
        ./beep.sh "$msg"
        read -p "$msg"
        if [[ $REPLY = "ok" ]]; then
            ./corePostXmls.sh ${target}
        fi
    fi

fi
