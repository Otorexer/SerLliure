#!/bin/bash
sudo apt update && sudo apt upgrade -y

# Directori Nextcloud
directorio="/root/nextcloud"

# Arxiu docker-compose.yml
archivo_docker_compose="$directorio/docker-compose.yml"

# Comprovar la instal·lació del Docker
if ! command -v docker &> /dev/null; then
  wget -qO- https://get.docker.com | sh;
  echo "Docker s'ha instal·lat correctament"
else
  echo "Docker està instal·lat."
fi

# Verificar si el directori existeix
if [ ! -d "$directorio" ]; then
 echo "Creant directori $directorio..."
 mkdir "$directorio"
else
 echo "El directori $directorio_ ja existeix."
fi

# Verificar si l'arxiu existeix
if [ ! -f "$archivo_docker_compose" ]; then
 echo "Descarregant docker-compose.yml"
 wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Nextcloud/docker-compose.yml -O "$archivo_docker_compose"

 read -p "Introdueix la contrasenya de la base de dades PostgreSQL: " postgres_password
 sed -i "s/POSTGRES_PASSWORD:.*/POSTGRES_PASSWORD: $postgres_password/g" "$docker_compose_file" # Substitueix POSTGRES_PASSWORD
else
 echo "L'arxiu $archivo_docker_compose ja existeix."
 echo "Si vols editar la configuracio fes servir la següent comanda: sudo nano $archivo_docker_compose"
fi

cd $directory
docker compose up -d

echo "La configuració de Nextcloud s'ha iniciat. Consulta la documentació per als següents passos." 
