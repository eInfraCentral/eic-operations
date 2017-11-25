#!/usr/bin/env bash

sudo apt install nginx
sudo cp ../eic-platform/nginx.proxy /etc/nginx/sites-available/nginx.proxy
sudo nano /etc/nginx/sites-available/nginx.proxy
sudo ln -s /etc/nginx/sites-available/nginx.proxy /etc/nginx/sites-enabled/nginx.proxy
sudo rm /etc/nginx/sites-enabled/default
sudo service nginx restart
./beep.sh
