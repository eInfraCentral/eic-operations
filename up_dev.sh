#!/usr/bin/env bash

killall node
#./blog.sh
cd ../eic-platform
rm nohup.out
nohup npm start &
