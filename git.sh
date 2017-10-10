#!/usr/bin/env bash

while read F  ; do
    echo -e "\e[96m$F\e[0m"
	git -C ../${F} "$@"
done <eic-project-list.txt
