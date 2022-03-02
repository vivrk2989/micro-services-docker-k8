#!/bin/bash

sudo apt-get update -y

sudo apt-get upgrade -y

sudo apt-get install nginx -y

sudo apt-get install npm

sudo apt-get install python-software-properties -y

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

sudo apt-get install nodejs -y

sudo npm install pm2 -g

sudo cp ~/app/provision/default /etc/nginx/sites-available/default

sudo systemctl restart nginx

#export DB_HOST=mongodb://192.168.10.150:27017/posts

echo "export DB_HOST='mongodb://192.168.10.150:27017/posts'" >> ~/.bashrc

source ~/.bashrc