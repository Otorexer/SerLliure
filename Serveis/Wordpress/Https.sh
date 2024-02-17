#!/bin/bash
# Comprueba y crea el directorio para los certificados SSL
if [ ! -d /etc/wordpress-https ]; then
    echo "Directory /etc/wordpress-https does not exist. Creating..."
    mkdir /etc/wordpress-https
fi

# Prompt de eliminación de certificados existentes
if [ -f /etc/wordpress-https/key.pem ] || [ -f /etc/wordpress-https/cert.pem ]; then
  read -p "Existing SSL certificates were found. Do you want to delete them? (y/n): " confirm_delete
  if [[ $confirm_delete != "y" ]] && [[ $confirm_delete != "Y" ]]; then
    echo "Certificates will not be deleted. Skipping generation..."
    exit 0
  fi
fi

# Genera los nuevos certificados (solo si el usuario confirma)
if [[ $confirm_delete == "y" ]] || [[ $confirm_delete == "Y" ]]; then
  # Generates new key.pem
  sudo openssl genpkey -algorithm RSA -out /etc/wordpress-https/key.pem

  # Generates new cert.pem based on the previusly generated key.pem
  sudo openssl req -new -x509 -key /etc/wordpress-https/key.pem -out /etc/wordpress-https/cert.pem -days 365
fi

# Gives permisison to caddy for accesing the files
sudo chown caddy:caddy /etc/wordpress-https/key.pem
sudo chown caddy:caddy /etc/wordpress-https/cert.pem
sudo chmod 600 /etc/wordpress-https/key.pem
sudo chmod 644 /etc/wordpress-https/cert.pem
