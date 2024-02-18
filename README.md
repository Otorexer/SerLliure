# Ser Lliure, Ser Autònom
Aquest repositori conté guies pas a pas per a la instal·lació d'eines self-hosted populars. Les guies estan dissenyades per a usuaris novells i expliquen tots els passos necessaris de manera senzilla tot hi aixo tenim que tenir alguns coneixaments sobre servidors i configuracions. Tenen com a objectiu animar a més persones a muntar els seus propis serveis i ser autònomes tecnològicament, evitant dependre d'empreses multinacionals que venen les dades personals.

## [Docker](https://github.com/docker)
### Què és?
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

### [Headscale](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Headscale)
Headscale és un servidor de control WireGuard de codi obert que permet crear i gestionar una xarxa privada virtual (VPN) segura i personalitzada. A diferència de Tailscale, Headscale s'allotja al vostre propi servidor, cosa que us dóna un control total sobre la vostra infraestructura VPN i les dades.

### [Caddy](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Caddy)
Caddy és un servidor web lleuger que pot actuar com a proxy invers per a una o més aplicacions web. Això significa que Caddy pot rebre sol·licituds HTTP o HTTPS dels clients i reenviar-les a un servidor web diferent, segons la configuració, tambe permet generar certificats SSL de forma simple amb Let's Encrypt.

### [NginxProxyManager](https://github.com/Otorexer/SerLliure/tree/main/Serveis/NginxProxyManager)
NginxProxyManager és una interfície d'usuari web basada en panells per a la gestió de servidors proxy Nginx. Simplifica la configuració i gestió de servidors proxy Nginx, permetent-te crear, editar i eliminar proxies amb facilitat.

### [Pi-Hole](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Pi-Hole)
Pi-Hole és un servidor DNS que bloqueja la publicitat a nivell de xarxa. Filtra dominis publicitaris coneguts i evita que es carreguin al navegador o aplicacions.


## Administracio
En aquest apartat parlarem sobre la Administracio del nostre server, com les nostre recomenacions per tenir un millor servidor.

### [Portainer-CE](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Portainer-CE)
Portainer és una plataforma de gestió i administració de contenidors Docker. Ofereix una interfície gràfica per gestionar imatges, contenidors, xarxes i volums de Docker.

### [Webmin](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Webmin)
Webmin és una eina d'administració de sistemes basada en web que permet gestionar servidors Unix, Linux i Windows de manera remota. Ofereix una interfície gràfica fàcil d'utilitzar per a una gran varietat de tasques administratives.


## Serveis

### [Wordpress](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Wordpress)
WordPress és un sistema de gestió de continguts (CMS) de codi obert que permet crear i gestionar llocs web de manera fàcil i flexible. S'utilitza per a una gran varietat de llocs web, des de blogs personals fins a grans llocs web corporatius i botigues en línia.


## Suporta Aquest Projecte
Si voleu suportar aquest projecte hem poden fer donacions per la pagina de BuyMeACoffee

<a href="https://www.buymeacoffee.com/otorexer" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/arial-white.png" alt="Buy Me A Coffee" style="height: 82px !important;width: 348px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>
