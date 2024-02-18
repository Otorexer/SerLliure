#!/bin/bash
sudo apt update && sudo apt upgrade -y

# Directori Nextcloud
directory="/root/nextcloud"

# Arxiu docker-compose.yml
docker_compose_file="$directory/docker-compose.yml"

# Comprovar la instal·lació del Docker
if ! command -v docker &> /dev/null; then
  wget -qO- https://get.docker.com | sh;
  echo "Docker s'ha instal·lat correctament"
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
 wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Nextcloud/docker-compose.yml -O "$docker_compose_file"

 read -p "Introdueix la contrasenya de la base de dades PostgreSQL: " postgres_password
 sed -i "s/POSTGRES_PASSWORD:.*/POSTGRES_PASSWORD: $postgres_password/g" "$docker_compose_file"

 # Demanar a l'usuari el directori per emmagatzemar els volums
 read -p "Introdueix el directori per emmagatzemar els volums (Recomanació: /etc): " volume_directory
 sed -i "s|/etc/nextcloud-database|$volume_directory/wordpress|g" "$docker_compose_file"
 sed -i "s|/etc/nextcloud-database|$volume_directory/wordpress-database|g" "$docker_compose_file"
else
 echo "L'arxiu $docker_compose_file ja existeix."
 echo "Si vols editar la configuracio fes servir la següent comanda: sudo nano $docker_compose_file"
fi

cd $directory
docker compose up -d

# Afegir un missatge d'èxit bàsic 
echo "La configuració de Nextcloud s'ha iniciat. Consulta la documentació per als següents passos." 
