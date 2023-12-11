#!/bin/bash

# Exit script on any error
set -e

# Check if the script is running as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Step 2: Modify systemd-resolved.conf
sed -i 's/#DNSStubListener=yes/DNSStubListener=no/' /etc/systemd/resolved.conf

# Step 3: Reload and Restart systemd-resolved
systemctl reload-or-restart systemd-resolved

# Step 1: Create Docker Compose File for Pi-hole
cat <<EOF > docker-compose.yml
version: "3"
services:
  pihole:
    image: pihole/pihole:latest
    container_name: pihole
    environment:
      - TZ=Europe/Madrid
    volumes:
      - /etc/pihole/etc:/etc/pihole
      - /etc/pihole/dnsmasq.d:/etc/dnsmasq.d
    ports:
      - 53:53/tcp
      - 53:53/udp
      - 8080:80/tcp
    restart: always
EOF

# Step 4: Start Pi-hole using Docker Compose
docker compose up -d

rm docker-compose.yml
docker exec -it pihole pihole -a -p
echo "Pi-hole installation complete."
