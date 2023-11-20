
# Ser Lliure Ser Autonom
Aquest repositori conté guies pas a pas per instal·lar eines self-hosted populars. Les guies estan pensades per a usuaris novells, explicant tots els passos necessaris de manera senzilla. L'objectiu és animar a més persones a muntar els seus propis serveis i ser autònomes tecnològicament, evitant dependre d'empreses multinacionals que venen les dades personals.

## [Docker](https://github.com/docker)
### Que es
Docker és una plataforma de virtualització a nivell de sistema operatiu que permet executar aplicacions dins de contenidors aïllats. En lloc de virtualitzar tot el maquinari com en les màquines virtuals, Docker empaqueta l'aplicació juntament amb les seves dependències en un contenidor que es pot executar de forma aïllada.

### Instalacio
Instalacio amb un script official de [Docker](https://github.com/docker/docker-install)

```bash
wget -qO- https://get.docker.com | sh
```

## Networking
### [Tailscale](https://tailscale.com/)
Tailscale és una xarxa VPN que permet connectar dispositius de forma segura sense necessitat de configurar routers o ports. Utilitza autenticació per clau pública i tot el tràfic està encriptat.
Tailscale nessesita de un compte de mail per registrar-se hi es un dels pocs programes en aquest repositori que recomenem que el fagis servir amb els seus serivdors ja que hostejar el servei es molt complicat.
#### [Instalacio](https://tailscale.com/download/)
#### [Configuracio](https://login.tailscale.com/admin)
### [FRP - Fast Reverse Proxy](https://github.com/fatedier/frp)

#### Server
```bash
wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/FRP/frps.sh && bash frps.sh && rm frps.sh
```
#### Client
```bash
wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/FRP/frpc.sh && bash frpc.sh && rm frpc.sh
```
Uninstall
```bash
wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/FRP/frp-remove.sh && bash frp-remove.sh && rm frp-remove.sh
```

#### Client

