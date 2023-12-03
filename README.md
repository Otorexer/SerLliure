# Ser Lliure, Ser Autònom
Aquest repositori conté guies pas a pas per instal·lar eines self-hosted populars. Les guies estan pensades per a usuaris novells, expliquen tots els passos necessaris de manera senzilla i tenen com a objectiu animar a més persones a muntar els seus propis serveis i ser autònomes tecnològicament, evitant dependre d'empreses multinacionals que venen les dades personals.

## [Docker](https://github.com/docker)
### Què és
Docker és una plataforma de virtualització a nivell de sistema operatiu que permet executar aplicacions dins de contenidors aïllats. En lloc de virtualitzar tot el maquinari com en les màquines virtuals, Docker empaqueta l'aplicació juntament amb les seves dependències en un contenidor que es pot executar de forma aïllada.

### Instal·lació
Instal·lació amb un script oficial de [Docker](https://github.com/docker/docker-install):

```bash
wget -qO- https://get.docker.com | sh
```

## Networking
#### Accedir al servidor de forma privada
Recomanem instal·lar Tailscale per poder accedir al teu servidor de forma privada, ja que pots accedir al servidor amb la xarxa local o pública sense tenir que obrir ports al router.

La vantatge de Tailscale és que no és com una VPN convencional, sinó que és una VPN Mesh, això vol dir que la connexió sempre serà directa del teu servidor a un client sense passar pel servidor, ja que el servidor, que és el que controla Tailscale, només es dedica a administrar els dispositius de la xarxa i fer que es vinculin correctament.

[Explicació Completa](https://tailscale.com/blog/how-tailscale-works/)
#### Accedir al servidor de forma publica
Si volem que tot internet pugui accedir al nostre servidor tenim 2 opcions.

La primera opcio es obrir ports al nostre router que es la tipica i la mes facil on hi han milers de tutorials al youtube sobre aquest tema.

La segona opcio es contractar una VPS amb una IP publica on hi instalarem una proxy per poder accedir al servidor de forma publica, farem servir 2 serveis NginxProxy i Fast Reverse Proxy, farem servir NginxProxy per tot el que siguin servidors que funcionen amb http i https ja que d'aquesta forma poden demanar certificats SSL de forma facil amb CertBot, i farem server Fast Reverse Proxy per enrutar ports de tcp i udp aixo ens serviria per exeposar serveis que no siguin http com per exemple el Samba que nessesita del port 445 o com un servidor de jocs com podria ser el Minecraft que requereis del port 25565.

#### DNS
Per accedir al servidor de forma mes facil farem servir servidors DNS, nosaltres recomanem tenir tenir 2 DNS. Un DNS sera amb un Domini public per si tenim que accedir al nostre servidor de forma public ja que d'aquesta forma podrem accedir al servidor sense tinguer-nos de enrecordar de la IP i laltre servidor sera un servidor DNS privar que domes gent de la nostre xarxa podra accedir.

##### DNS Public
El DNS public es molt facil podem comprar el nostre propi Domini per moltes pagines. O tambe hi ha pagines que ofereixen subdominis de forma gratuita.

##### DNS Privat
El DNS Privat podem fer servir el mateix de Tailscale que no es molt recomanable ja que tenim poc control sobre les accions com per exemple tindras un domini com aquest (snow-universe.ts.net) cosa que es molt llarc i no molt poc atractiu. El que nosaltres recomanem es crear el nostre propi servidor DNS amb Ad

### [Tailscale](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Tailscale)
Tailscale és una xarxa VPN que permet connectar dispositius de forma segura sense necessitat de configurar routers o ports. Utilitza autenticació per clau pública i tot el tràfic està encriptat.

Tailscale necessita un compte de correu per registrar-se i és un dels pocs programes en aquest repositori que no recomanem que utilitzis amb els teus servidors, ja que hostejar el servei és molt complicat i no es molt practic.

### [Headscale](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Headscale)
Headscale és un servidor VPN basat en WireGuard, dissenyat per a connexions segures i eficients en diferents xarxes. Ofereix gestió centralitzada, suport a múltiples SO i és ideal per a entorns amb diversos usuaris.

### [FRP - Fast Reverse Proxy](https://github.com/Otorexer/SerLliure/tree/main/Serveis/FRP)
FRS és un servidor proxy invers que permet exposar aplicacions d'un servidor intern a internet de forma segura. Fa de passarel·la entre els clients externs i el servidor backend.
