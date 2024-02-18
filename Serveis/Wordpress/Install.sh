#!/bin/bash
sudo apt update && sudo apt upgrade -y

# Directori WordPress
directory="/root/wordpress"

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
 wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Wordpress/docker-compose.yml -O "$docker_compose_file"

 # Demanar a l'usuari la contrasenya root de MySQL
 read -p "Introdueix la contrasenya root de MySQL: " mysql_root_password
 sed -i "s/MYSQL_ROOT_PASSWORD: wordpress-root/MYSQL_ROOT_PASSWORD: $mysql_root_password/g" "$docker_compose_file"

 # Demanar a l'usuari el directori per emmagatzemar els volums
 read -p "Introdueix el directori per emmagatzemar els volums (Recomanació: /etc): " volume_directory
 sed -i "s|/etc/wordpress|$volume_directory/wordpress|g" "$docker_compose_file"
 sed -i "s|/etc/wordpress-db|$volume_directory/wordpress-db|g" "$docker_compose_file"
else
 echo "L'arxiu $archivo_docker_compose ja existeix."
 echo "Si vols editar la configuracio fes servir la següent comanda: sudo nano $docker_compose_file"
fi

cd $directory
docker compose up -d

# Afegir un missatge d'èxit bàsic 
echo "La configuració de WordPress s'ha iniciat. Consulta la documentació per als següents passos." 
