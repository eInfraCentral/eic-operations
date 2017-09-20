#!/usr/bin/env bash
cd ../eic-platform
docker stop eic-platform
docker rm eic-platform
docker run -p 3000:80 -d --name eic-platform eic-platform
