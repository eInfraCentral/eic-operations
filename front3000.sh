#!/usr/bin/env bash
cd ../eic-platform
npm install
killall node
nohup npm start &