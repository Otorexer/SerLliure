#!/bin/bash

# Caddy Installation Script

echo "Installing required keyrings and transport package..."
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https

echo "Adding Caddy's GPG key..."
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg

echo "Adding Caddy to the apt sources list..."
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list

echo "Updating apt package list..."
sudo apt update

echo "Installing Caddy..."
sudo apt install caddy

echo "Caddy installation complete."
