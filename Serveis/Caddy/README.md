# Instal·lació
Per instal·lar Caddy només hem d'executar aquest comandament.
```bash
sudo rm -f Install.sh && wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Caddy/Install.sh && sudo bash Install.sh && sudo rm Install.sh
```
# Configuracio
El fitxar de configuracio de Caddy es troba a **/etc/caddy/Caddyfile** si volem afegir alguna proxy ho eliminar alguna ho tenim que fer des d'aqui.

Podem editar la configuracio amb el seguent comande
```bash
sudo nano /etc/caddy/Caddyfile
```

Un cop estiguem de editar la configuracio tenim que fer servir **systemctl reload caddy** per actualitzar el servei i que tots els canvis s'apliquin.
```bash
sudo systemctl reload caddy
```
