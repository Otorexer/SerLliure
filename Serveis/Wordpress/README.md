# Instal·lació
Per instal·lar WordPress només hem d'executar aquest comandament.
```bash
sudo rm -f Install.sh && wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Wordpress/Install.sh && sudo bash Install.sh && sudo rm Install.sh
```
Un cop tinguem WordPress Instalat estara en el port 11180 i el PhpMyAdmin en el port 11181

Com que en aquest Repositori recomanem el us de Caddy farem tota la configuracio amb Caddy

[Si no tenim instalat el caddy podem instalar-lo des del tutorial seguent.](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Caddy)

# Configuracio Caddy
