#!/usr/bin/env bash
cd ../eic-platform
docker stop eic-platform
docker run -p 80:80 -d --name eic-platform eic-platform