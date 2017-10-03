#!/usr/bin/env bash

./pull.sh
./npmi.sh &
./up_prod.sh &
./mcip.sh
./delData.sh
./back_down.sh
./back.sh

while read line; do
	if [[ $line =~ "INFO: Server startup in" ]] ; then
		break;
	fi
done < <(docker logs tomcat -f 2>&1)

./addData.sh
./back_down.sh
./back.sh

