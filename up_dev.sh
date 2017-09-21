#!/usr/bin/env bash

./front_dev_blog.sh
./front_dev_down.sh
cd ../eic-platform
rm nohup.out
nohup npm start &
