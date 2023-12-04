#!/bin/bash

# Step 1: Modify systemd-resolved configuration
echo "Configuring systemd-resolved..."
sudo mkdir -p /etc/systemd/resolved.conf.d
echo -e "[Resolve]\nDNS=127.0.0.1\nDNSStubListener=no" | sudo tee /etc/systemd/resolved.conf.d/adguardhome.conf
sudo mv /etc/resolv.conf /etc/resolv.conf.backup
sudo ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf
sudo systemctl reload-or-restart systemd-resolved

# Step 2: Pull the Docker image
echo "Pulling the AdGuard Home Docker image..."
docker pull adguard/adguardhome

# Define directories
CONFIG_DIR="/etc/adguardhome/conf"
DATA_DIR="/etc/adguardhome/work"

# Create directories for persistent configuration and data
echo "Creating directories for persistent data..."
mkdir -p "$DATA_DIR"
mkdir -p "$CONFIG_DIR"

# Create and run the container
echo "Creating and running the AdGuard Home container..."
docker run --name adguardhome \
    --restart unless-stopped \
    -v "$DATA_DIR":/opt/adguardhome/work \
    -v "$CONFIG_DIR":/opt/adguardhome/conf \
    -p 53:53/tcp -p 53:53/udp\
    -p 80:80/tcp -p 443:443/tcp -p 443:443/udp -p 3000:3000/tcp\
    -p 853:853/tcp\
    -p 853:853/udp\
    -p 5443:5443/tcp -p 5443:5443/udp\
    -p 6060:6060/tcp\
    -p 10001:10001\
    -d adguard/adguardhome
