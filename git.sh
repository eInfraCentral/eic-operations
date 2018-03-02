#!/usr/bin/env bash
declare -A aliases=(["data"]="eInfraCentral/eic-data" ["docker"]="eInfraCentral/eic-docker" ["dock"]="eInfraCentral/eic-docker"
["model"]="eInfraCentral/eic-registry-model" ["api"]="eInfraCentral/eic-registry-api" ["rest"]="eInfraCentral/eic-registry-rest"
["registry"]="eInfraCentral/eic-registry" ["reg"]="eInfraCentral/eic-registry" ["plat"]="eInfraCentral/eic-platform"
["platform"]="eInfraCentral/eic-platform" ["nginx"]="eInfraCentral/eic-nginx" ["analytics"]="eInfraCentral/eic-analytics"
["anal"]="eInfraCentral/eic-analytics" ["verbose"]="plambros/verbose-palm-tree" ["faq"]="courado/uoa-admin-tools")
commands=()
projects=()

clone=0

#filter projects/commands
for arg in "$@" ; do
    if [[ -n "${aliases[$arg]}" ]]; then
        projects+=("${aliases[$arg]}")
    else
        if [[ "$arg" == "clone" ]]; then
            clone=1
        fi
        commands+=(${arg})
    fi
done

#if no projects, then do all
if [[ ${#projects[@]} -eq 0 ]]; then
    projects=($(cat project-list.txt))
fi

#bash is amazing, here we join an array using spaces
join() {
    local IFS=" "
    echo "$*"
}

for project in "${projects[@]}"; do
    echo -e "\e[96m${project}\e[0m"
    projectShort=$(echo ${project} | cut -d'/' -f2)
    if [[ ${clone} -eq 1 ]]; then
        cmd="git clone https://github.com/${project}.git ../$projectShort"
    else
        cmd="git -C ../${projectShort} $(join "${commands[@]}")"
    fi
    ${cmd}
done