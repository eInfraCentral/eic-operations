#!/usr/bin/env bash
cd ../eic-platform
docker stop eic-platform
docker rm eic-platform
npm run build:docker