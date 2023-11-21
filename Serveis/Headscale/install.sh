#!/bin/bash

# Demana a l'usuari que introdueixi la URL del servidor
read -p "Introdueix la URL del servidor (sense 'https://' ni port, ex: example.com): " server_url

# Assegura que la URL sempre comenci amb "https://" i estableix el port com a 8080
server_url="https://$server_url:8080"

# URL de l'API de GitHub per a les publicacions de Headscale
API_URL="https://api.github.com/repos/juanfont/headscale/releases"

# Obté l'última versió utilitzant l'API de GitHub
LATEST_VERSION=$(curl -s "$API_URL" | grep -oP '"tag_name": "\Kv[0-9.]+(?=")' | head -1)

# Si no es troba la versió, sortir de l'script
if [ -z "$LATEST_VERSION" ]; then
    echo "No es pot trobar la versió més recent de Headscale."
    exit 1
fi

# Elimina la 'v' inicial de la versió
LATEST_VERSION=${LATEST_VERSION#v}

# Construir l'URL de descàrrega
DOWNLOAD_URL="https://github.com/juanfont/headscale/releases/download/v${LATEST_VERSION}/headscale_${LATEST_VERSION}_linux_amd64.deb"

# Descarregar el paquet
wget --output-document=headscale.deb "$DOWNLOAD_URL"

# Verificar la descàrrega
if [ ! -f headscale.deb ]; then
    echo "La descàrrega de Headscale ha fallat."
    exit 1
fi

# Instal·lar Headscale
sudo dpkg --install headscale.deb

# Modificar la configuració de Headscale per utilitzar la URL proporcionada
sudo sed -i "s|server_url:.*|server_url: $server_url|" /etc/headscale/config.yaml
sudo sed -i "s|listen_addr: 127.0.0.1:8080|listen_addr: 0.0.0.0:8080|" /etc/headscale/config.yaml

# Habilitar i iniciar el servei Headscale
sudo systemctl enable headscale
sudo systemctl start headscale

# Confirmar que Headscale està funcionant
systemctl status headscale
