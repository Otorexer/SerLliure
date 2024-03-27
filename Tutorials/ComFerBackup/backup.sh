#!/bin/bash
# Set RSYNC Variables
USER=""
PASSWD=""
SERVER=""
SERVER_BACKUP_DIR=""

# Docker containers to stop
DOCKER_STOP=(

)
# Directories to backup
ROUTES=(

)

# Install required dependencies
# Check if rsync is installed
if ! command -v rsync &> /dev/null; then
    echo "rsync is not installed. Installing..."
    sudo apt install rsync -y
else
    echo "rsync is already installed."
fi

# Check if sshpass is installed
if ! command -v sshpass &> /dev/null; then
    echo "sshpass is not installed. Installing..."
    sudo apt install sshpass -y
else
    echo "sshpass is already installed."
fi

# Directory for temporary backup storage
TODAY=$(date +%Y-%m-%d)
BACKUP_DIR="/root/backup"
mkdir "$BACKUP_DIR"

# Stop Docker containers
docker stop "${DOCKER_STOP[@]}"

# Backup script for specified directories
for i in "${!ROUTES[@]}"; do
    ROUTE_NAME[$i]="${ROUTES[$i]//\//-}"
    ROUTE_NAME[$i]="${ROUTE_NAME[$i]#-}"
    cd "${ROUTES[$i]}"
    tar -czvf "$BACKUP_DIR/${ROUTE_NAME[$i]}-$TODAY.tar.gz" *
done

# Start Docker containers
docker start "${DOCKER_STOP[@]}"

# Backup docker-compose.yml
cp /root/docker-compose.yml "$BACKUP_DIR/docker-compose-$TODAY.yml"

# Backup Caddyfile
cp /etc/caddy/Caddyfile "$BACKUP_DIR/Caddyfile-$TODAY.yml"

# Sync backups to the server
sshpass -p "$PASSWD" rsync -avz "$BACKUP_DIR/" "$USER@$SERVER:$SERVER_BACKUP_DIR"