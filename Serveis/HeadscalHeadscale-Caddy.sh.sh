#!/bin/bash

# Function to configure Caddy reverse proxy
configure_caddy_proxy() {
    if command -v caddy &> /dev/null; then
        # Extract the domain name
        domain_name=$(grep 'server_url:' /etc/headscale/config.yaml | sed -e 's/^.*server_url: //' -e 's|https://||' -e 's|/.*$||')

        echo "Configuring Caddy reverse proxy for $domain_name..."
        echo "$domain_name {" >> /etc/caddy/Caddyfile
        echo "    reverse_proxy localhost:8080" >> /etc/caddy/Caddyfile
        echo "}" >> /etc/caddy/Caddyfile
        sudo systemctl reload caddy
        echo "Caddy configuration updated and reloaded."
    else
        echo "Caddy is not installed. Please install Caddy to use this configuration."
    fi
}

# Main execution
configure_caddy_proxy
