#!/bin/bash

# Funció per configurar el proxy invers de Caddy
configure_caddy_proxy() {
  if command -v caddy &> /dev/null; then
    # Extreure el nom del domini
    domain_name=$(grep 'server_url:' /etc/headscale/config.yaml | sed -e 's/^.*server_url: //' -e 's|https://||' -e 's|/.*$||')

    echo "Configurant el proxy invers de Caddy per $domain_name..."
    echo "$domain_name {" >> /etc/caddy/Caddyfile
    echo "  reverse_proxy localhost:8080" >> /etc/caddy/Caddyfile
    echo "}" >> /etc/caddy/Caddyfile
    sudo systemctl reload caddy
    echo "Configuració de Caddy actualitzada i recarregada."
  else
    echo "Caddy no està instal·lat. Instal·la'l per poder utilitzar aquesta configuració."
  fi
}

# Execució principal
configure_caddy_proxy
