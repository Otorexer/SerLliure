# Ser Lliure, Ser Autònom

Aquest repositori conté guies pas a pas per a la instal·lació d'eines self-hosted populars. Les guies estan dissenyades per a usuaris novells i expliquen tots els passos necessaris de manera senzilla, tot i que és recomanable tenir alguns coneixements sobre servidors i configuracions.

Aquests tutorials tenen com a objectiu animar a més persones a muntar els seus propis serveis i ser autònomes tecnològicament, evitant dependre d'empreses multinacionals que venen les dades personals.

## [Docker](https://github.com/docker)

### Què és?

Docker és una plataforma de virtualització a nivell de sistema operatiu que permet executar aplicacions dins de contenidors aïllats. En lloc de virtualitzar tot el maquinari com en les màquines virtuals, Docker empaqueta l'aplicació amb les seves dependències en un contenidor que es pot executar de forma aïllada.

### Per què ho farem servir?

Utilitzarem Docker per crear contenidors aïllats del sistema operatiu base. Això garanteix que el nostre servei funcioni correctament independentment de la màquina on s'allotgi. A més, Docker facilita la migració dels nostres serveis de servidor a servidor, ja que només cal copiar la imatge del contenidor al nou servidor i executar-la. Això garanteix la compatibilitat entre servidors, independentment del sistema operatiu que utilitzin.

### Instal·lació

Per instal·lar Docker, utilitzeu aquest script oficial de [Docker](https://github.com/docker/docker-install):

```bash
wget -qO- https://get.docker.com | sh
```

## Docker Compose

### Què és?

Docker Compose és una eina que complementa Docker per a la gestió d'aplicacions complexes que consten de diversos contenidors interdependents. En comptes de gestionar cada contenidor individualment, Docker Compose permet definir i orquestrar tota l'aplicació en un únic fitxer YAML.

Docker Compose ja està instal·lat per defecte quan instal·les Docker.

[Com funciona Docker Compose](https://github.com/Otorexer/SerLliure/tree/main/Tutorials/ComUtilitzarDockerCompose)

# Guies

## [VPS Gratuït amb Oracle](https://github.com/Otorexer/SerLliure/tree/main/Tutorials/OracleFreeTier)

# Tutorials de Serveis

## Xarxa

En aquest apartat parlarem sobre la xarxa del nostre servidor, així com les nostres recomanacions.

### [❗Recomanacions❗](https://github.com/Otorexer/SerLliure/blob/main/Recomanacions/Networking.md)

### [Tailscale](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Tailscale)

Tailscale és una xarxa VPN que connecta dispositius de forma segura sense configurar routers o ports. Utilitza autenticació per clau pública i encripta tot el tràfic.

### [Headscale](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Headscale)

Headscale és un servidor de control WireGuard de codi obert que permet crear i gestionar una xarxa privada virtual (VPN) segura i personalitzada. A diferència de Tailscale, Headscale s'allotja al vostre propi servidor, cosa que us dóna un control total sobre la vostra infraestructura VPN i les dades.

### [Caddy](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Caddy)

Caddy és un servidor web lleuger que pot actuar com a proxy invers per a una o més aplicacions web. Això significa que Caddy pot rebre sol·licituds HTTP o HTTPS dels clients i reenviar-les a un servidor web diferent, segons la configuració. També permet generar certificats SSL de forma simple amb Let's Encrypt.

### [NginxProxyManager](https://github.com/Otorexer/SerLliure/tree/main/Serveis/NginxProxyManager)

NginxProxyManager és una interfície d'usuari web basada en panells per a la gestió de servidors proxy Nginx. Simplifica la configuració i gestió de servidors proxy Nginx, permetent-te crear, editar i eliminar proxies amb facilitat.

### [Pi-Hole](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Pi-Hole)

Pi-Hole és un servidor DNS que bloqueja la publicitat a nivell de xarxa. Filtra dominis publicitaris coneguts i evita que es carreguin al navegador o aplicacions.

## Administració

En aquest apartat parlarem sobre l'administració del nostre servidor, així com les nostres recomanacions per tenir un millor servidor.

### [Portainer-CE](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Portainer-CE)

Portainer és una plataforma de gestió i administració de contenidors Docker. Ofereix una interfície gràfica per gestionar imatges, contenidors, xarxes i volums de Docker.

### [Webmin](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Webmin)

Webmin és una eina d'administració de sistemes basada en web que permet gestionar servidors Unix, Linux i Windows de manera remota. Ofereix una interfície gràfica fàcil d'utilitzar per a una gran varietat de tasques administratives.

## Serveis

### [WordPress](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Wordpress)

WordPress és un sistema de gestió de continguts (CMS) de codi obert que permet crear i gestionar llocs web de manera fàcil i flexible. S'utilitza per a una gran varietat de llocs web, des de blogs personals fins a grans llocs web corporatius i botigues en línia.

## Suporta Aquest Projecte

Si voleu suportar aquest projecte, podeu fer donacions a través de la pàgina de BuyMeACoffee.

<a href="https://www.buymeacoffee.com/otorexer" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/arial-white.png" alt="Buy Me A Coffee" style="height: 82px !important;width: 348px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a