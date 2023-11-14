#!/bin/sh
#Gets you public ip for later
publicip=$(curl ipinfo.io/ip)

#Nextcloud-AIO Installer
sudo docker run --init --sig-proxy=false --name nextcloud-aio-mastercontainer --restart always --publish 80:80 --publish 8080:8080 --publish 8443:8443 --volume nextcloud_aio_mastercontainer:/mnt/docker-aio-config --volume /var/run/docker.sock:/var/run/docker.sock:ro nextcloud/all-in-one:latest

#Shows portainer addres in console for fast connect
echo "https://$publicip:8080"
