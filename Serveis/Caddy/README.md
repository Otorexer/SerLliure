# Instal·lació
Per instal·lar Caddy només hem d'executar aquest comandament.
```bash
rm -f I-Caddy.sh && wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Caddy/I-Caddy.sh && bash I-Caddy.sh && rm I-Caddy.sh
```
# Configuracio
El fitxar de configuracio de Caddy es troba a **/etc/caddy/Caddyfile** si volem afegir alguna proxy ho eliminar alguna ho tenim que fer des d'aqui.

Un cop estiguem de editar la configuracio tenim que fer servir **systemctl reload caddy** per actualitzar el servei i que tots els canvis s'apliquin.
