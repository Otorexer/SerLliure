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

## Networking
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
Per al DNS privat, es pot utilitzar el de Tailscale, encara que ofereix poc control. Recomanem crear un propi servidor DNS amb AdGuard o una solució similar com Bind.

### [Tailscale](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Tailscale)
Tailscale és una xarxa VPN que connecta dispositius de forma segura sense configurar routers o ports. Utilitza autenticació per clau pública i encripta tot el tràfic.

Tailscale requereix un compte de correu per a la seva configuració i és un dels pocs programes d'aquest repositori que no recomanem hostejar amb els teus servidors, ja que hostejar-lo és complicat i poc pràctic.

### [Headscale](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Headscale)
Headscale és un servidor VPN basat en WireGuard, dissenyat per a connexions segures i eficients en diverses xarxes. Ofereix gestió centralitzada i suport a múltiples sistemes operatius, ideal per a entorns amb diversos usuaris.

### [FRP - Fast Reverse Proxy](https://github.com/Otorexer/SerLliure/tree/main/Serveis/FRP)
FRP és un servidor proxy invers que permet exposar aplicacions d'un servidor intern a internet de manera segura. Actua com a passarel·la entre clients externs i el servidor backend.
