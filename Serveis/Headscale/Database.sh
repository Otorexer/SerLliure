#!/bin/bash

# Actualització i millora dels paquets del sistema
sudo apt update && sudo apt upgrade -y

# Directori per Headscale
directory="/root/headscale"

# Fitxer docker-compose 
docker_compose_file="$directory/docker-compose.yml"

# Comprova si Docker està instal·lat
if wget -qO- https://get.docker.com | sh; then
    echo "Docker s'ha instal·lat correctament"
else
    echo "Ha fallat la instal·lació de Docker. Si us plau, revisa si hi ha errors."
    exit 1
fi

# Comprova si el directori existeix
if [ ! -d "$directory" ]; then
  echo "Creant el directori $directory..."
  mkdir "$directory"
else
  echo "El directori $directory ja existeix."
fi

# Comprova si el fitxer docker-compose existeix
if [ ! -f "$docker_compose_file" ]; then
  echo "Descarregant docker-compose.yml"
  wget -q https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Headscale/docker-compose.yml -O "$docker_compose_file"
   
  # Demana a l'usuari la contrasenya de PostgreSQL
  read -p "Introdueix la contrasenya de la base de dades PostgreSQL: " postgres_password
  sed -i "s/POSTGRES_PASSWORD:.*/POSTGRES_PASSWORD: $postgres_password/g" "$docker_compose_file" # Substitueix POSTGRES_PASSWORD
else
  echo "El fitxer $docker_compose_file ja existeix."
  echo "Per editar la configuració, utilitza l'ordre següent: sudo nano /root/headscale/docker-compose.yml"
fi

# Canvia al directori especificat
cd "$directory" || exit

# Inicia els serveis de Docker Compose
docker-compose up -d

echo "La configuració de la base de dades s'ha iniciat. Si us plau, consulta la documentació per als passos següents."
