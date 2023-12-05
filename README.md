# Ser Lliure, Ser Autònom
Aquest repositori conté guies pas a pas per a la instal·lació d'eines self-hosted populars. Les guies estan dissenyades per a usuaris novells i expliquen tots els passos necessaris de manera senzilla. Tenen com a objectiu animar a més persones a muntar els seus propis serveis i ser autònomes tecnològicament, evitant dependre d'empreses multinacionals que venen les dades personals.

## [Docker](https://github.com/docker)
### Què és
Docker és una plataforma de virtualització a nivell de sistema operatiu que permet executar aplicacions dins de contenidors aïllats. En lloc de virtualitzar tot el maquinari com en les màquines virtuals, Docker empaqueta l'aplicació amb les seves dependències en un contenidor que es pot executar de forma aïllada.

### Instal·lació
Per instal·lar Docker, utilitzeu aquest script oficial de [Docker](https://github.com/docker/docker-install):
```bash
wget -qO- https://get.docker.com | sh
```
## [VPS Gratuit amb Oracle](https://github.com/Otorexer/SerLliure/blob/main/Tutorials/OracleFreeTier.md)
## Networking
En aquest apartat parlarem sobre la Xarxa del nostre server, com les nostre recomenacions.
### [❗Recomanacions❗](https://github.com/Otorexer/SerLliure/blob/main/Recomanacions/Networking.md)
### [Tailscale](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Tailscale)
Tailscale és una xarxa VPN que connecta dispositius de forma segura sense configurar routers o ports. Utilitza autenticació per clau pública i encripta tot el tràfic.

Tailscale requereix un compte de correu per a la seva configuració i és un dels pocs programes d'aquest repositori que no recomanem hostejar amb els teus servidors, ja que hostejar-lo és complicat i poc pràctic.

### [AdGuardHome](https://github.com/Otorexer/SerLliure/tree/main/Serveis/AdGuardHome)
AdGuard Home és un bloquejador d'anuncis i seguiments a nivell de xarxa. Instal·lat en un servidor, protegeix tots els dispositius connectats a la xarxa domèstica, oferint filtrat de contingut personalitzat i estadístiques detallades per a una gestió eficaç de la privacitat en línia.

### [BIND DNS](https://github.com/Otorexer/SerLliure/tree/main/Serveis/BIND)
BIND9 és un servidor DNS de codi obert, ampliament utilitzat per traduir noms de dominis a adreces IP. Ofereix funcionalitats de resolució de noms, autoritat de domini i servei de cache, essent una eina essencial per a la gestió de xarxes i internet.

### [NginxProxyManager](https://github.com/Otorexer/SerLliure/tree/main/Serveis/NginxProxyManager)
Nginx Proxy Manager és una interfície gràfica d'usuari per a Nginx, facilitant la configuració de proxies, SSL i accés a llocs web, ideal per a administradors que busquen una solució simple i potent.

## Administracio
En aquest apartat parlarem sobre la Administracio del nostre server, com les nostre recomenacions.

### [Portainer-CE](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Portainer-CE)
Portainer és una plataforma de gestió i administració de contenidors Docker. Ofereix una interfície gràfica per gestionar imatges, contenidors, xarxes i volums de Docker.

## Suporta Aquest Projecte
Si voleu suportar aquest projecte hem poden fer donacions per la pagina de BuyMeACoffee
<a href="https://www.buymeacoffee.com/gbraad" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/black_img.png" alt="Buy Me A Coffee" style="height: 82px !important;width: 348px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>
