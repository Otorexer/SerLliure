
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
| **Paràmetre**           | **Descripció**                                                                      | **Valor per Defecte** |
|-------------------------|--------------------------------------------------------------------------------------|------------------------|
| **bind_port**           | Port en què el servidor FRP (frps) escolta les connexions del client FRP (frpc). | **5443**              |
| **vhost_http_port**     | Port per al trànsit HTTP entrant al servidor FRP.                                   | **80**                |
| **vhost_https_port**    | Port per al trànsit HTTPS entrant al servidor FRP.                                  | **443**               |
| **dashboard_port**      | Port per accedir al quadre de control del servidor FRP.                             | **6443**              |
| **dashboard_user**      | Nom d'usuari per accedir al quadre de control del servidor FRP.                      | **"admin"**           |
| **dashboard_pwd**       | Contrasenya generada aleatòriament per al quadre de control.                          | **Generada**          |
| **token**               | Token generat aleatòriament per autenticació entre client i servidor FRP.           | **Generat**            |
| **subdomain_host**      | Configuració per a l'encaminament basat en subdominis.                               | **IP pública**        |
| **max_pool_count**      | Màxim de connexions agrupades entre client i servidor.                                | **50**                 |
| **log_level**           | Verbositat dels registres generats per FRP.                                           | **1**                  |
| **log_max_days**        | Dies que es conserven els fitxers de registre.                                       | **3**                  |
| **log_file**            | Habilita o deshabilita la generació de registres a un fitxer.                         | **Habilitat**          |
| **tcp_mux**             | Habilita la multiplexació de corrents TCP.                                           | **Habilitat**          |
| **KCP support**         | Habilita el protocol KCP per millorar la transmissió de xarxa.                        | **Habilitat**          |

#### Client

