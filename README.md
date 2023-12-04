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

#### Accedir al servidor de forma privada
Recomanem instal·lar Tailscale per accedir al servidor de manera privada, permetent l'accés a través de la xarxa local o pública sense necessitat d'obrir ports al router.

La principal avantatge de Tailscale és que opera com una VPN Mesh, la qual cosa significa que la connexió sempre és directa entre el servidor i un client, sense passar per un servidor intermediari. Així, Tailscale es dedica principalment a administrar els dispositius de la xarxa i assegurar la correcta vinculació entre ells.

[Explicació Completa](https://tailscale.com/blog/how-tailscale-works/)
#### Accedir al servidor de forma pública
Si desitgem que tot internet pugui accedir al nostre servidor, tenim dues opcions:

La primera opció és obrir ports al nostre router, la qual és l'opció més típica i senzilla, amb nombrosos tutorials disponibles a YouTube.

La segona opció consisteix en contractar una VPS amb una IP pública, on instal·larem un proxy per a l'accés públic al servidor. Utilitzarem dos serveis: NginxProxy per a servidors que operen amb HTTP i HTTPS, ja que permet sol·licitar certificats SSL fàcilment amb CertBot, i Fast Reverse Proxy per a enrutament de ports TCP i UDP, útil per a serveis que no són HTTP, com ara Samba (que necessita del port 445) o un servidor de jocs com Minecraft (que requereix del port 25565).

#### DNS
Per facilitar l'accés al servidor, utilitzarem servidors DNS. Recomanem tenir dos DNS: un públic i un privat.

##### DNS Públic
El DNS públic es pot configurar comprant un domini propi o utilitzant subdominis gratuïts que ofereixen algunes pàgines.

##### DNS Privat
Per al DNS privat, es pot utilitzar el de Tailscale, encara que ofereix poc control i no es molt facil de enrecordar. Recomanem crear un propi servidor DNS amb AdGuard i Bind per aquesta forma tenir una protecio i Dominis Privat bonics i facils de controlar.

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
