#!/bin/bash

# Define Headscale version and config URL
HEADSCALE_VERSION="0.23.0-alpha2"
CONFIG_URL="https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Headscale/config.yaml"

# Function to download and install or update Headscale
install_or_update_headscale() {
    ARCH=$(dpkg --print-architecture)
    DOWNLOAD_URL="https://github.com/juanfont/headscale/releases/download/v${HEADSCALE_VERSION}/headscale_${HEADSCALE_VERSION}_linux_${ARCH}.deb"

    wget --output-document=headscale.deb $DOWNLOAD_URL
    sudo dpkg -i headscale.deb
    rm headscale.deb
}

echo "Installing Headscale..."
install_or_update_headscale
rm -r /etc/headscale/config.yaml
sudo wget $CONFIG_URL -O /etc/headscale/config.yaml

read -p "Enter the desired server URL (without https://): " domain_name
# Update Headscale config
sudo sed -i "s|server_url:.*|server_url: https://${domain_name}|" /etc/headscale/config.yaml

echo "Enabling and starting Headscale service..."
sudo systemctl enable headscale
sudo systemctl start headscale
