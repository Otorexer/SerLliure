#!/bin/bash

# Actualitza els paquets del sistema
sudo apt update && sudo apt upgrade -y

# Prepara el sistema per la instal·lació de Caddy

# Instal·la claus i paquets de transport per a una gestió segura de paquets
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https

# Afegeix la clau GPG oficial de Caddy per a la verificació de l'autenticitat del paquet
# Força la sobreescriptura de qualsevol clau existent
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg --yes 

# Afegeix el repositori Caddy a les fonts de programari del sistema
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list

# Actualitza la informació del paquet
sudo apt update

# Instal·la Caddy
sudo apt install caddy -y

# Finalitza amb un missatge informatiu
echo "Instal·lació de Caddy completada!"
echo "Recordeu configurar Caddy segons les vostres necessitats (https://caddyserver.com/docs)"
