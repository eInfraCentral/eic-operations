#!/usr/bin/env bash

declare -a specials=("beta.einfracentral.eu" "dl068.madgik.di.uoa.gr" "localhost")

source=${1}
target=${2}
type=${3}

if [ -z "$3" ]; then
    type=elastic
fi

force=true

for i in "${specials[@]}"; do
    if [ "$i" == "$target" ] ; then
        force=false
        msg="WARNING: Sure you want to overwrite from ${source} to ${target}? (yes/no)"
        ./beep.sh "$msg"
        read -p "$msg"
        if [[ $REPLY = "yes" ]]; then
            force=true
        fi
    fi
done

if [ "$force" = true ]; then
    cd ../eic-data/exports/
    stamp=$(date +%s)
    sudo mv xmls xmls.${stamp}
    if [ "$type" = elastic ]; then
        sudo mv elasticJasons elasticJasons.${stamp}
        ./elasticDumpJasons.sh ${source}
        ./elasticConvertJasonsToXmls.js
        ./elasticPostXmls.sh ${target}
    fi
    if [ "$type" = core ]; then
        sudo mv jsons jsons.${stamp}
        ./coreDumpJasons.sh ${source}
        ./coreConvertJasonsToXmls.js
        ./corePostXmls.sh ${target}
    fi

fi
