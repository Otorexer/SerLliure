# [<-- Pagina Principal](https://github.com/Otorexer/SerLliure)
# [FRP - Fast Reverse Proxy](https://github.com/fatedier/frp)
## Servidor
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

## Client
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
