# Instal·lació
Per instal·lar WordPress només hem d'executar aquest comandament.
```bash
sudo rm -f Install.sh && wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Wordpress/Install.sh && sudo bash Install.sh && sudo rm Install.sh
```
Un cop tinguem WordPress Instalat estara en el port 11180 i el PhpMyAdmin en el port 11181.

Com que en aquest Repositori recomanem el us de Caddy farem tota la configuracio amb Caddy.

[Si no tenim instalat el caddy podem instalar-lo des del tutorial seguent.](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Caddy)

# Configuracio Caddy
Per accedir a la configuracio de caddy farem servir el seguent comande.
```bash
sudo nano /etc/caddy/Caddyfile
```
## Sense domini
Si no tenim un Domini propi i volem configurar el Worpress posarem la seguent configuracio.
```bash
:80 {
    reverse_proxy localhost:11180
}
```
Hi despres farem un reset al servei perque s'apliqui la configuracio.
```bash
sudo systemctl reload caddy
```
### HTTPS
Si tambe volem configurar WordPress perque vagi amb HTTPS i no HTTP tenim que fer el seguent.

Primer de tot executarem aquest script per crear claus ssl creades per nosaltres.
```bash
sudo rm -f Https.sh && wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Wordpress/Https.sh && sudo bash Https.sh && sudo rm Https.sh
```
Despres tenim que canviar una mica la configuracio de Caddy.

Te que quedar aixis
```bash
:80 {
    redir https://{host}{uri}
}

:443 {
    reverse_proxy localhost:11180
    tls /etc/wordpress-https/cert.pem /etc/wordpress-https/key.pem
}
```
Hi despres farem un reset al servei perque s'apliqui la configuracio.
```bash
sudo systemctl reload caddy
```
## Amb domini
[Tenim una guia mes completa de com configurar Caddy depenent de les vostres nessesitats.](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Caddy)

Si tenim un domini domes tenim que afegir aixo a la configuracio i editar la la part on surt (elteudomini.com), d'aquesta forma els certificats es demanaran de forma automatica a Let's Encrypt.

Es important que havans de fer aixo tenimr que configurar el Domini o Subdomini perque apuntin al servir on tenim instalat Caddy.
```bash
elteudomini.com {
    reverse_proxy localhost:11180
}
```

Hi despres farem un reset al servei perque s'apliqui la configuracio.
```bash
sudo systemctl reload caddy
```
