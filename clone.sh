#!/usr/bin/env bash

while read F  ; do
    org=$(echo ${F} | cut -d'/' -f1)
    prj=$(echo ${F} | cut -d'/' -f2)
    git clone https://github.com/${org}/${prj}.git ../${prj}
done <project-list.txt
