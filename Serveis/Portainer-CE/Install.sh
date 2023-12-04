#!/bin/sh
#Gets you public ip for later
publicip=$(curl ipinfo.io/ip)

#Installs portainer
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

#Shows portainer addres in console for fast connect
echo "https://$publicip:9443"
