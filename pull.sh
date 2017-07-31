#!/usr/bin/env bash
while read F  ; do
	echo -e "\e[96m$F\e[0m"
	cd ../$F
	git pull
done <eic-project-list.txt
