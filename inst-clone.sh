#!/usr/bin/env bash

while read F  ; do
	git clone https://github.com/eInfraCentral/${F}.git ../${F}
done <eic-project-list.txt
./beep.sh
