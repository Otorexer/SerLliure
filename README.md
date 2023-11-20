
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
**bind_port** (per defecte 5443): Aquest és el port en què el servidor FRP (frps) escolta les connexions entrants del client FRP (frpc).

**vhost_http_port** (per defecte 80): Aquesta configuració especifica el port en què el servidor FRP escoltarà el trànsit HTTP entrant. S'utilitza quan es redireccionen les sol·licituds HTTP a la xarxa interna.

**vhost_https_port** (per defecte 443): Similar a vhost_http_port, però per al trànsit HTTPS. El servidor FRP escolta aquest port per a les sol·licituds HTTPS per reenviar-les.

**dashboard_port** (per defecte 6443): Aquest port s'utilitza per accedir al quadre de control del servidor FRP, una interfície web on pots supervisar i gestionar el servidor.

**dashboard_user** (per defecte "admin"): L'usuari per defecte per accedir al quadre de control del servidor FRP.

**dashboard_pwd:** La contrasenya per al quadre de control. Es genera de manera aleatòria i es recomana canviar-la per motius de seguretat.

**token:** Un token generat aleatòriament que s'utilitza per a l'autenticació entre el client i el servidor FRP. És consellable canviar aquest token per garantir una comunicació segura.

**subdomain_host** (per defecte la teva IP pública): Aquesta configuració s'utilitza per a l'encaminament basat en subdominis. Normalment s'estableix com la IP pública del servidor FRP.

**max_pool_count** (per defecte 50): Això estableix el nombre màxim de connexions agrupades que es poden crear entre el client i el servidor. Es recomana deixar-ho com està per defecte.

**log_level** (per defecte 1): Defineix la verbositat dels registres generats pel FRP. El nivell 1 és típicament per a informació general.

**log_max_days** (per defecte 3): Determina durant quant temps es conserven els fitxers de registre.

**log_file** (per defecte 1): Aquesta configuració habilita o deshabilita la generació de registres a un fitxer.

**tcp_mux** (per defecte 1): Això habilita la multiplexació de corrents TCP, on diverses connexions lògiques es multiplexen en una sola connexió TCP.

**suport KCP:** Aquesta configuració habilita el protocol KCP, que és un protocol ràpid i fiable que pot millorar el rendiment de la transmissió de xarxa.

####Client

