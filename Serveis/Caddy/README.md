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

## Exemples de configuracions
### Punts importants
Avans de crear una nova reverse proxy tenim que configurar el nostre Domini amb un nou Registre DNS apuntant a la IP Public del Servidor de Caddy, podem trobar molts tutorials al youtube de com fer-ho.

**elteudomini.com:** Aqui tenim que posar el domini o subdomini que volem configurar per on la gent accedirar en aquest servei que previament hem creat el Registre DNS.

**dnsLocal:** Aqui configurarem la dnsLocal de Tailscale o Headscale on esta allotjat el servei perque el servidor de Caddy ho pugui redireccionar al servidor corresponent.

Si hem seguit el tutorial d'aquest Repositori per instalar Headscale el dnsLocal sera similar al seguent: nomEquip.nomUsuari.local

**port:** Aqui posarem el port on el troba el Servei. A cada tutorial posem a quin port es configuren per defecte els Serveis, doncs tenim que posar allo.

Per exemple Webmin esta configurat amb el port 10000

### Basica amb DNS
Una configuracio basica del Caddy seria aquesta.
```bash
elteudomini.com {
    reverse_proxy (dnsLocal):(port)
}
```

Aquesta configuracio crea un reverse proxy al Servei que tu li assignes.

### Basica amb IP
>[!WARNING]
>No recomanem configurar res d'aquesta forma ja que no es practic hi domes podem tenir 1 servei allotat a la vegada.

Una configuracio basica del Caddy amb IP seria aquesta
```bash
:80 {
    reverse_proxy (dnsLocal):(port)
}
```

Aquesta configuracio crea un reverse proxy al Servei que tu li assignes.
