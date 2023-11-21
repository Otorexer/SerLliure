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
### [Tailscale](https://tailscale.com/)
Tailscale és una xarxa VPN que permet connectar dispositius de forma segura sense necessitat de configurar routers o ports. Utilitza autenticació per clau pública i tot el tràfic està encriptat.

Tailscale necessita un compte de correu per registrar-se i és un dels pocs programes en aquest repositori que recomanem que utilitzis amb els teus servidors, ja que hostejar el servei és molt complicat.

#### [Instal·lació](https://tailscale.com/download/)
#### [Configuració](https://login.tailscale.com/admin)
### [FRP - Fast Reverse Proxy](https://github.com/fatedier/frp)



#### Servidor
```bash
wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/FRP/frps.sh && bash frps.sh && rm frps.sh
```
| Variable           | Descripció                                    | Valor per Defecte    |
|--------------------|----------------------------------------------|-----------------------|
| subDomainHost      | Host de subdomini                            | example.com           |
| bindAddr           | Adreça de vinculació                          | 0.0.0.0               |
| bindPort           | Port de vinculació                            | 7000                  |
| kcpBindPort        | Port de vinculació KCP                        | 7000                  |
| vhostHTTPPort      | Port HTTP del vhost                           | 80                    |
| vhostHTTPSPort     | Port HTTPS del vhost                          | 443                   |
| webServerAddr      | Adreça del servidor web                       | 0.0.0.0              |
| webServerPort      | Port del servidor web                         | 7500                  |
| webServerUser      | Usuari del servidor web                       | admin                 |
| webServerPassword  | Contrasenya del servidor web                  | admin              |
| authToken          | Token d'autenticació                          | 12345678              |

#### Client
```bash
wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/FRP/frpc.sh && bash frpc.sh && rm frpc.sh
```
| Variable           | Descripció                                    | Valor per Defecte    |
|--------------------|----------------------------------------------|-----------------------|
| frpcUser           | Nom d'usuari del client FRP                  | your_name             |
| serverAddr         | Adreça del servidor FRP                       | 0.0.0.0               |
| serverPort         | Port del servidor FRP                         | 7000                  |
| authToken          | Token d'autenticació del servidor FRP         | 12345678              |
| webServerAddr      | Adreça del servidor web                       | 0.0.0.0             |
| webServerPort      | Port del servidor web                         | 7400                  |
| webServerUser      | Usuari del servidor web                       | admin                 |
| webServerPassword  | Contrasenya del servidor web                 | admin                 |

Desinstal·lació
```bash
wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/FRP/frp-remove.sh && bash frp-remove.sh && rm frp-remove.sh
```
