#!/usr/bin/env bash

while read F  ; do
	git -C ../$F "$@"
done <eic-project-list.txt
