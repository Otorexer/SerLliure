#!/bin/bash
sudo apt update && sudo apt upgrade -y

# Directori Pi-Hole
directory="/root/piHole"

# Arxiu docker-compose.yml
docker_compose_file="$directory/docker-compose.yml"

# Comprovar la instal·lació del Docker
if ! command -v docker &> /dev/null
then
  if wget -qO- https://get.docker.com | sh; then 
    echo "Docker s'ha instal·lat correctament"
  else
    echo "La instal·lació del Docker ha fallat. Si us plau, comproveu els errors."
    exit 1 # Sortida amb un codi d'error 
  fi
else
  echo "Docker està instal·lat."
fi

# Verificar si el directori existeix
if [ ! -d "$directory" ]; then
 echo "Creant directori $directory..."
 mkdir "$directory"
else
 echo "El directori $directory ja existeix."
fi

# Verificar si l'arxiu existeix
if [ ! -f "$docker_compose_file" ]; then
 echo "Descarregant docker-compose.yml"
 wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Pi-Hole/docker-compose.yml -O "$docker_compose_file"
else
 echo "L'arxiu $docker_compose_file ja existeix."
 echo "Si vols editar la configuracio fes servir la següent comanda: sudo nano $docker_compose_file"
fi

sed -i 's/#DNSStubListener=yes/DNSStubListener=no/' /etc/systemd/resolved.conf
systemctl reload-or-restart systemd-resolved

cd $directory
docker compose up -d

# Afegir un missatge d'èxit bàsic 
echo "La configuració de PI-Hole s'ha iniciat. Consulta la documentació per als següents passos." 
