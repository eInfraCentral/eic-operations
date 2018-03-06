#!/usr/bin/env bash
declare -A aliases=(["model"]="eic-registry-model" ["api"]="eic-registry-api"
                    ["rest"]="eic-registry-rest" ["registry"]="eic-registry" ["reg"]="eic-registry")
commands=()
projects=()

#filter projects/commands
for arg in "$@" ; do
    if [[ -n "${aliases[$arg]}" ]]; then
        projects+=("${aliases[$arg]}")
    else
        commands+=(${arg})
    fi
done

#if no projects, then do all
if [[ ${#projects[@]} -eq 0 ]]; then
    projects=("eic-registry-model" "eic-registry-api" "eic-registry-rest" "eic-registry")
fi

#bash is amazing, here we join an array using spaces
join() {
    local IFS=" "
    echo "$*"
}

for project in "${projects[@]}"; do
    echo -e "\e[96m${project}\e[0m"
    mvn $(join "${commands[@]}") -f ../${project}/pom.xml
done

./beep.sh "Finished building"