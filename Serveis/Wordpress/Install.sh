#!/bin/bash
sudo apt update && sudo apt upgrade -y

# Directori WordPress
directorio="/root/wordpress"

# Arxiu docker-compose.yml
archivo_docker_compose="$directorio/docker-compose.yml"

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
if [ ! -d "$directorio" ]; then
 echo "Creant directori $directorio..."
 mkdir "$directorio"
else
 echo "El directori $directorio_ ja existeix."
fi

# Verificar si l'arxiu existeix
if [ ! -f "$archivo_docker_compose" ]; then
 echo "Descarregant docker-compose.yml"
 wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Wordpress/docker-compose.yml -O "$archivo_docker_compose"

 # Demanar a l'usuari la contrasenya root de MySQL
 read -p "Introdueix la contrasenya root de MySQL: " mysql_root_password
 sed -i "s/MYSQL_ROOT_PASSWORD: wordpress-root/MYSQL_ROOT_PASSWORD: $mysql_root_password/g" /root/wordpress/docker-compose.yml

 # Demanar a l'usuari el directori per emmagatzemar els volums
 read -p "Introdueix el directori per emmagatzemar els volums (Recomanació: /etc): " volume_directory
 sed -i "s|/etc/wordpress|$volume_directory/wordpress|g" /root/wordpress/docker-compose.yml
 sed -i "s|/etc/wordpress-db|$volume_directory/wordpress-db|g" /root/wordpress/docker-compose.yml
else
 echo "L'arxiu $archivo_docker_compose ja existeix."
 echo "Si vols editar la configuracio fes servir la següent comanda: sudo nano /root/wordpress/docker-compose.yml"
fi

cd $directorio
docker compose up -d

# Afegir un missatge d'èxit bàsic 
echo "La configuració de WordPress s'ha iniciat. Consulta la documentació per als següents passos." 
