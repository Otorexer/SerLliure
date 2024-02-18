#!/bin/bash

# Certificate directory setup
if [ ! -d /etc/wordpress-https ]; then
  echo "Directory /etc/wordpress-https does not exist. Creating..."
  mkdir /etc/wordpress-https
fi

# Certificate management - Deletion and conditional generation
if [ -f /etc/wordpress-https/key.pem ] || [ -f /etc/wordpress-https/cert.pem ]; then
  read -p "Existing SSL certificates were found. Do you want to delete them? (y/n): " confirm_delete

  if [[ $confirm_delete = "y" ]] || [[ $confirm_delete = "Y" ]]; then
    rm -i /etc/wordpress-https/key.pem /etc/wordpress-https/cert.pem
    echo "Certificates deleted."

    # Certificate generation
    sudo openssl genpkey -algorithm RSA -out /etc/wordpress-https/key.pem
    sudo openssl req -new -x509 -key /etc/wordpress-https/key.pem -out /etc/wordpress-https/cert.pem -days 365
  else
    echo "Certificates will not be deleted. Skipping generation..."
  fi
  else
  sudo openssl genpkey -algorithm RSA -out /etc/wordpress-https/key.pem
  sudo openssl req -new -x509 -key /etc/wordpress-https/key.pem -out /etc/wordpress-https/cert.pem -days 365
fi

# Permissions for Caddy
sudo chown caddy:caddy /etc/wordpress-https/key.pem
sudo chown caddy:caddy /etc/wordpress-https/cert.pem
sudo chmod 600 /etc/wordpress-https/key.pem
sudo chmod 644 /etc/wordpress-https/cert.pem
