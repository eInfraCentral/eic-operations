#!/usr/bin/env bash

while read F  ; do
    prj=$(echo ${F} | cut -d'/' -f2)
    echo -e "\e[96m${F}\e[0m"
    git -C ../${prj} "${@}"
done <project-list.txt
