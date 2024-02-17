#!/bin/bash

echo "**Preparant el sistema per a la instal·lació de Caddy:**"

echo " - Instal·lant claus i paquets de transport per a una gestió segura de paquets..."
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https

echo " - Afegint la clau GPG oficial de Caddy per a la verificació de l'autenticitat del paquet..."
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg

echo " - Afegint el repositori de Caddy a les fonts de programari del sistema..."
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list

echo "**Actualitzant la informació dels paquets:**"
sudo apt update

echo "**Instal·lant Caddy:**"
sudo apt install caddy -y

# Missatge informatiu de finalització:
echo "**Instal·lació de Caddy completada!**"
echo "Recordeu de configurar Caddy segons les vostres necessitats (https://caddyserver.com/docs)"
