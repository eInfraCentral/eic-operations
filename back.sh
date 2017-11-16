#!/usr/bin/env bash
cd ../eic-docker
docker-compose up -d --build
while read line; do
	if [[ ${line} =~ "INFO: Server startup in" ]] ; then
		break;
	fi
done < <(docker logs tomcat -f 2>&1)

