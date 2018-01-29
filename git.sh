#!/usr/bin/env bash

while read F  ; do
    prj=$(echo ${F} | cut -d'/' -f2)
    git -C ../${prj} "$@" &
done <project-list.txt
