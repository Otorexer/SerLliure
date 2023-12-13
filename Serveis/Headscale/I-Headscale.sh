#!/bin/bash

# Define Headscale version and config URL
HEADSCALE_VERSION="0.23.0-alpha2"
CONFIG_URL="https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Headscale/config.yaml"

# Function to download and install or update Headscale
install_or_update_headscale() {
    ARCH=$1
    DOWNLOAD_URL="https://github.com/juanfont/headscale/releases/download/v${HEADSCALE_VERSION}/headscale_${HEADSCALE_VERSION}_linux_${ARCH}.deb"

    wget --output-document=headscale.deb $DOWNLOAD_URL
    sudo dpkg -i headscale.deb
    rm headscale.deb
}

# Function to enable and start the Headscale service
enable_and_start_service() {
    echo "Enabling and starting Headscale service..."
    sudo systemctl enable headscale
    sudo systemctl start headscale
}

# Function to ask user for the domain name and update Headscale and Caddy configurations
configure_domain() {
    read -p "Enter the desired server URL (without https://): " domain_name
    # Update Headscale config
    sudo sed -i "s|server_url:.*|server_url: https://${domain_name}|" /etc/headscale/config.yaml
    # Update Caddy config
    if command -v caddy &> /dev/null; then
        echo "Configuring Caddy reverse proxy for $domain_name..."
        echo "$domain_name {" >> /etc/caddy/Caddyfile
        echo "    reverse_proxy localhost:8080" >> /etc/caddy/Caddyfile
        echo "}" >> /etc/caddy/Caddyfile
        sudo systemctl reload caddy
        echo "Caddy configuration updated and reloaded."
    else
        echo "Caddy is not installed. Skipping Caddy configuration."
    fi
}

# Check if Headscale is already installed
if command -v headscale &> /dev/null; then
    echo "Headscale is already installed. Updating Headscale package only..."
    ARCH=$(dpkg --print-architecture)
    install_or_update_headscale "$ARCH"
    enable_and_start_service
    configure_domain
else
    echo "Installing Headscale..."
    ARCH=$(dpkg --print-architecture)
    install_or_update_headscale "$ARCH"
    sudo wget $CONFIG_URL -O /etc/headscale/config.yaml
    enable_and_start_service
    configure_domain
fi
