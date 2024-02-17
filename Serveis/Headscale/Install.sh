#!/bin/bash

# Defineix la versió de Headscale i la URL de configuració
HEADSCALE_VERSION="0.23.0-alpha2"
CONFIG_URL="https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Headscale/config.yaml"

# Funció per descarregar i instal·lar o actualitzar Headscale
install_or_update_headscale() {
 ARCH=$(dpkg --print-architecture) || {
 echo "Error: No s'ha pogut determinar l'arquitectura." >&2
 exit 1
 }

 DOWNLOAD_URL="https://github.com/juanfont/headscale/releases/download/v${HEADSCALE_VERSION}/headscale_${HEADSCALE_VERSION}_linux_${ARCH}.deb"

 wget --output-document=headscale.deb "$DOWNLOAD_URL" || {
 echo "Error: Ha fallat la descàrrega." >&2
 exit 1
 }

 sudo dpkg -i headscale.deb || {
 echo "Error: Ha fallat la instal·lació." >&2
 exit 1
 }

 rm headscale.deb
}

echo "Instal·lant Headscale..."
install_or_update_headscale

# Elimina la configuració existent (si hi ha)
rm -rf /etc/headscale/config.yaml

# Descarrega i desa el fitxer de configuració
sudo wget -O /etc/headscale/config.yaml "$CONFIG_URL" || {
 echo "Error: Ha fallat la descàrrega de la configuració." >&2
 exit 1
}

# Demana i valida el nom de domini
read -p "Introdueix la URL del servidor desitjada (sense https://): " domain_name

# Actualitza la configuració de Headscale
sudo sed -i "s|server_url:.*|server_url: https://$domain_name|" /etc/headscale/config.yaml

echo "Habilitant i iniciant el servei Headscale..."
sudo systemctl enable headscale
sudo systemctl start headscale

echo "Installacio de Headscale completada. Consulta la documentacio per als seguents passos."
