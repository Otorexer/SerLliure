
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
Per instalar el servidor de FRP ho farem amb un script de [MvsCode](https://github.com/MvsCode) que simplifica molt el process.
```bash
wget https://raw.githubusercontent.com/MvsCode/frps-onekey/master/install-frps.sh -O ./install-frps.sh && chmod 700 ./install-frps.sh && ./install-frps.sh install
```
| Paràmetre                | Descripció                                                                                                        | Valor per Defecte          |
|-------------------------|------------------------------------------------------------------------------------------------------------------|----------------------------|
| bind_port               | Aquest és el port en què el servidor FRP (frps) escolta les connexions entrants del client FRP (frpc).          | 5443                       |
| vhost_http_port         | Aquesta configuració especifica el port en què el servidor FRP escoltarà el trànsit HTTP entrant.               | 80                         |
| vhost_https_port        | Similar a vhost_http_port, però per al trànsit HTTPS. El servidor FRP escolta aquest port per a les sol·licituds HTTPS per reenviar-les. | 443                        |
| dashboard_port          | Aquest port s'utilitza per accedir al quadre de control del servidor FRP, una interfície web on pots supervisar i gestionar el servidor. | 6443                       |
| dashboard_user          | El nom d'usuari per defecte per accedir al quadre de control del servidor FRP.                                | "admin"                    |
| dashboard_pwd           | La contrasenya per al quadre de control. Es genera de manera aleatòria i es recomana canviar-la per motius de seguretat. | Generada Aleatòriament   |
| token                   | Un token generat aleatòriament que s'utilitza per a l'autenticació entre el client i el servidor FRP. És consellable canviar aquest token per garantir una comunicació segura. | Generat Aleatòriament   |
| subdomain_host          | Aquesta configuració s'utilitza per a l'encaminament basat en subdominis. Normalment s'estableix com la IP pública del servidor FRP. | La teva IP pública per defecte |
| max_pool_count          | Això estableix el nombre màxim de connexions agrupades que es poden crear entre el client i el servidor. Es recomana deixar-ho com està per defecte. | 50                       |
| log_level               | Defineix la verbositat dels registres generats per FRP. Nivell 1 és típicament per a informació general. | 1                          |
| log_max_days            | Determina quant temps es conserven els fitxers de registre.                                                         | 3                          |
| log_file                | Aquesta configuració habilita o deshabilita la generació de registres a un fitxer.                                  | 1 (Habilitat)              |
| tcp_mux                 | Això habilita la multiplexació de corrents TCP, on diverses connexions lògiques es multiplexen en una sola connexió TCP. | 1 (Habilitat)          |
| KCP support             | Aquesta configuració habilita el protocol KCP, que és un protocol ràpid i fiable que pot millorar el rendiment de la transmissió de xarxa. | Habilitat             |


####Client

