#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install nano -y

# Check Docker Installation
if ! command -v docker &> /dev/null
then
wget -qO- https://get.docker.com | sh
else
    echo "Docker is installed."
fi
mkdir /root/wordpress
wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Wordpress/docker-compose.yml -O /root/wordpress/docker-compose.yml

# Prompt user for MySQL Root Password
read -p "Enter MySQL root password: " mysql_root_password
sed -i "s/MYSQL_ROOT_PASSWORD: wordpress-root/MYSQL_ROOT_PASSWORD: $mysql_root_password/g" /root/wordpress/docker-compose.yml

# Prompt user for directory to store volumes
read -p "Enter directory to store volumes (e.g., /path/to/volumes): " volume_directory
sed -i "s|/etc/wordpress|$volume_directory/wordpress|g" /root/wordpress/docker-compose.yml
sed -i "s|/etc/wordpress-db|$volume_directory/wordpress-db|g" /root/wordpress/docker-compose.yml

cd /root/wordpress
docker compose up -d
