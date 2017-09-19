#!/usr/bin/env bash

function pull {
	git -C ../$1 pull
	echo -e "\e[96m$1\e[0m"
}

while read F  ; do
	pull $F &
done <eic-project-list.txt
wait
