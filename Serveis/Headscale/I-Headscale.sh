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

# Function to update the Headscale configuration
update_config() {
    echo "Updating Headscale configuration..."
    sudo wget $CONFIG_URL -O /etc/headscale/config.yaml
}

# Function to enable and start the Headscale service
enable_and_start_service() {
    echo "Enabling and starting Headscale service..."
    sudo systemctl enable headscale
    sudo systemctl start headscale
}

# Function to ask user and update Caddy configuration if Caddy is installed
update_caddy_config() {
    read -p "Do you want to update the Caddy configuration for reverse proxy? (y/n): " update_caddy
    if [[ "$update_caddy" =~ ^[Yy]$ ]] && command -v caddy &> /dev/null; then
        # Extract the domain name
        domain_name=$(grep 'server_url:' /etc/headscale/config.yaml | sed -e 's/^.*server_url: //' -e 's|https://||' -e 's|/.*$||')

        echo "Configuring Caddy reverse proxy for $domain_name..."
        echo "$domain_name {" >> /etc/caddy/Caddyfile
        echo "    reverse_proxy localhost:8080" >> /etc/caddy/Caddyfile
        echo "}" >> /etc/caddy/Caddyfile
        sudo systemctl reload caddy
        echo "Caddy configuration updated and reloaded."
    else
        echo "Caddy update skipped or Caddy is not installed."
    fi
}

# Check if Headscale is already installed
if command -v headscale &> /dev/null; then
    echo "Headscale is already installed. Updating Headscale package only..."
    ARCH=$(dpkg --print-architecture)
    install_or_update_headscale "$ARCH"
    enable_and_start_service
    update_caddy_config
else
    echo "Installing Headscale..."
    ARCH=$(dpkg --print-architecture)
    install_or_update_headscale "$ARCH"
    update_config
    enable_and_start_service
    update_caddy_config
fi
