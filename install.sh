#!/bin/bash

echo "Do you want to install the Picamera Web API software?"
read -r -p "$1 [y/N] " response < /dev/tty
if [[ $response =~ ^(yes|y|Y)$ ]]; then
    echo "Greats ! The installation has started."
else
    echo "OK. Exiting"
    exit
fi

sudo apt-get update && sudo apt-get upgrade -y

installdir=/home/pi/PiCamera
wwwdir=/var/www/html
	
	
[[ -d $wwwdir ]] || sudo mkdir -p $wwwdir
[[ -d $wwwdir/api ]] || sudo mkdir -p $wwwdir/api
[[ -d $wwwdir/pictures ]] || sudo mkdir -p $wwwdir/pictures
[[ -d $installdir ]] || mkdir -p $installdir

sudo apt -y install nginx php php-fpm apache2-utils
PHPFPMINI=$(sudo find /etc/ \(  -name "php.ini" \) |grep fpm)
sudo sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' $PHPFPMINI
WWWCONF=$(sudo find /etc/ \(  -name "www.conf" \))
sudo sed -i 's/user = www-data/user = pi/g' $WWWCONF
sudo sed -i 's/group = www-data/group = pi/g' $WWWCONF
PHPFPMSERVICE=$(sudo systemctl -a |grep fpm.service|awk '{print $1}'|grep php)
sudo systemctl restart $PHPFPMSERVICE
sudo systemctl enable $PHPFPMSERVICE

sudo rm $wwwdir/index.nginx-debian.html

curl -sS https://raw.githubusercontent.com/darton/picamera/main/api/picamera.php > $installdir/picamera.php
curl -sS https://raw.githubusercontent.com/darton/picamera/main/nginx-default > $installdir/nginx-default
sudo touch $wwwdir/index.php
sudo cp $installdir/picamera.php $wwwdir/api/
sudo mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.org
sudo cp $installdir/nginx-default /etc/nginx/sites-available/default

sudo chown -R pi.pi $wwwdir
sudo systemctl restart nginx
sudo systemctl enable nginx
