#!/usr/bin/env bash
cd ../eic-platform
npm install
killall node
rm nohup.out
nohup npm start &
