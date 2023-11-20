
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

