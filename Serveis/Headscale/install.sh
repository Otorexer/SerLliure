#!/bin/bash

# Comprova si l'usuari és root
if [ "$(id -u)" -ne 0 ]; then
  echo "Aquest script ha de ser executat com a superusuari (root)." >&2
  exit 1
fi

# Crea una nova carpeta a /etc/headscale si no existeix
if [ ! -d "/etc/headscale" ]; then
  mkdir -p /etc/headscale
fi

# Crea una base de dades SQLite buida
touch /etc/headscale/db.sqlite

# Descarrega el fitxer de configuració 'config.yaml' des de GitHub
wget -O /etc/headscale/config.yaml https://raw.githubusercontent.com/juanfont/headscale/main/config-example.yaml

# Demana a l'usuari que introdueixi la URL del servidor
read -p "Introdueix la URL del servidor ex: example.com: " server_url

# Assegura que la URL sempre comenci amb "https://" i estableix el port com a 8080
server_url="http://$server_url:8080"

# Modificar la configuració de Headscale per utilitzar la URL proporcionada
sed -i "s|server_url:.*|server_url: $server_url|" /etc/headscale/config.yaml
sed -i "s|listen_addr: 127.0.0.1:8080|listen_addr: 0.0.0.0:8080|" /etc/headscale/config.yaml

# Crear el fitxer docker-compose.yml amb les especificacions proporcionades
cat <<EOL > docker-compose.yml
version: '3.5'
services:
  headscale:
    image: headscale/headscale:latest
    container_name: headscale
    network_mode: "host"
    volumes:
      - /etc/headscale:/etc/headscale
      - /var/lib/headscale:/var/lib/headscale
    command: headscale serve
    restart: unless-stopped
EOL

# Iniciar el contenidor de Headscale amb l'opció de reinici automàtic
docker compose up -d

echo "Headscale s'ha configurat i s'ha iniciat correctament amb reinici automàtic."
