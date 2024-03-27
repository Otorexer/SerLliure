#!/bin/bash
# RSYNC Variables
USER=""
PASSWD=""
SERVER=""
SERVER_BACKUP_DIR=""

# Carpetes a fer backup
DOCKER_STOP=(

)

ROUTE=(

)

# Instala Dependencies nessesaries
# Comprova si rsync esta instalat
if ! command -v rsync &> /dev/null; then
    echo "rsync is not installed. Installing..."
    sudo apt install rsync -y
else
    echo "rsync is already installed."
fi

# Comprova si sshpass esta instalat
if ! command -v sshpass &> /dev/null; then
    echo "sshpass is not installed. Installing..."
    sudo apt install sshpass -y
else
    echo "sshpass is already installed."
fi

# Carpeta on es fa backup temporalment els volums
TODAY=$(date +%Y-%m-%d)
BACKUP_DIR="/root/backup"
mkdir $BACKUP_DIR


# Stop Docker Containers
docker stop $DOCKER_STOP

# Script per fer Backup
for i in "${!ROUTE[@]}"; do
    ROUTE_NAME[$i]="${ROUTE[$i]//\//-}"
    ROUTE_NAME[$i]="${ROUTE_NAME[$i]#-}"
    cd "${ROUTE[$i]}"
    tar -czvf "$BACKUP_DIR/${ROUTE_NAME[$i]}-$TODAY.tar.gz" *
done

# Start Docker Containers
docker start $DOCKER_STOP

# Backup Docker Compose
cp /root/docker-compose.yml $BACKUP_DIR/docker-compose-$TODAY.yml

# Backup Caddy
cp /etc/caddy/Caddyfile $BACKUP_DIR/Caddyfile-$TODAY.yml

# Sync Between Server
sshpass -p $PASSWD rsync -avz $BACKUP_DIR/* $USER@$SERVER:$SERVER_BACKUP_DIR
