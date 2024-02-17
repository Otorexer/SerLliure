#!/bin/bash

# Define Headscale version and config URL
HEADSCALE_VERSION="0.23.0-alpha2"
CONFIG_URL="https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Headscale/config.yaml"

# Function to download and install or update Headscale
install_or_update_headscale() {
  ARCH=$(dpkg --print-architecture) || {
    echo "Error: Failed to determine architecture." >&2
    exit 1
  }

  DOWNLOAD_URL="https://github.com/juanfont/headscale/releases/download/v${HEADSCALE_VERSION}/headscale_${HEADSCALE_VERSION}_linux_${ARCH}.deb"

  wget --output-document=headscale.deb "$DOWNLOAD_URL" || {
    echo "Error: Download failed." >&2
    exit 1
  }

  sudo dpkg -i headscale.deb || {
    echo "Error: Installation failed." >&2
    exit 1
  }

  rm headscale.deb
}

echo "Installing Headscale..."
install_or_update_headscale

# Remove existing config (if any)
rm -rf /etc/headscale/config.yaml

# Download and place config file
sudo wget -O /etc/headscale/config.yaml "$CONFIG_URL" || {
  echo "Error: Downloading config failed." >&2
  exit 1
}

# Prompt and validate domain name
read -p "Enter the desired server URL (without https://): " domain_name

# Update Headscale config
sudo sed -i "s|server_url:.*|server_url: $domain_name|" /etc/headscale/config.yaml

echo "Enabling and starting Headscale service..."
sudo systemctl enable headscale
sudo systemctl start headscale

echo "Headscale installation complete!"
