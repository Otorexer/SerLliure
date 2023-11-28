### [Headscale](https://github.com/juanfont/headscale)
#### Servidor
```bash
wget https://github.com/Otorexer/SerLliure/blob/main/Serveis/Headscale/install.sh && bash install.sh && rm install.sh
```
| Variable     | Descripció                                                      | Valor per Defecte     |
|--------------|-----------------------------------------------------------------|-----------------------|
| server_url   | URL del servidor, ha de ser la IP pública o DNS personalitzat   | 127.0.0.1:8080        |
| listen_addr  | Adreça d'escolta, pot ser 0.0.0.0 o una IP d'adaptador específic| 0.0.0.0:8080          |
| base_domain  | Domini base, canviar al domini desitjat per DNS màgic           | example.com           |
| ip_prefixes  | Prefixos IP                                                     | ipv4 - 100.64.0.0/10  |
