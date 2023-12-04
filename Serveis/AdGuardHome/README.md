# Instalacio
Per instalar AdGuardHome amb docker domes tenim que executar aquest comande.

Hem de tenim compet que com que AdGuardHome fa servier el port 53/tpc i 53/udp tindrem que fer un canvis en la configuracio de Resolucio de DNS del servidor pero no hi ha problema ja que el script ho fa de forma automatica.
```bash
wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/AdGuardHome/Install.sh && bash Install.sh && rm Install.sh
```
# Primers passos
El primer inici de sessio el tenim que fer des de la direccio IP de Tailscale amb el port 3000.
