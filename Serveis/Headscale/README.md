# [<- Pagina Principal](https://github.com/Otorexer/SerLliure)
# [Headscale](https://github.com/juanfont/headscale)
## Servidor
```bash
wget https://github.com/Otorexer/SerLliure/blob/main/Serveis/Headscale/install.sh && bash install.sh && rm install.sh
```
| Variable     | Descripció                                                      | Valor per Defecte     |
|--------------|-----------------------------------------------------------------|-----------------------|
| server_url   | URL del servidor, ha de ser la IP pública o DNS personalitzat   | 127.0.0.1:8080        |
| listen_addr  | Adreça d'escolta, pot ser 0.0.0.0 o una IP d'adaptador específic| 0.0.0.0:8080          |
| base_domain  | Domini base, canviar al domini desitjat per DNS màgic           | example.com           |
| ip_prefixes  | Prefixos IP                                                     | ipv4 - 100.64.0.0/10  |
## Client
Primer de tot hem de crear un usuari amb el comande de `headscale users c NOM_USUARI` despres tindrem un usuari on els nodes es podran connectar.
### Utilització de la Pàgina Web per a la Configuració
1. **Iniciar Tailscale**: Al terminal, introdueix `tailscale up --login-server=URL_CONFIGURADA`. Aquesta URL configurada s'ha de canviar pel valor que has posat a `server_url` en la configuració.
2. **Obtenir Comanda del Servidor**: A continuació, s'obrirà una pàgina web on trobaràs una comanda.
3. **Configuració del Node**: Copia aquesta comanda al terminal del teu servidor. Cal canviar `USER` en la comanda pel nom d'usuari que vols assignar al node.

### Creació d'una Clau d'Autenticació
1. **Generar Clau d'Autenticació**: Primer, al servidor, executa `headscale preauthkeys create -u NOM_USUARI`. Això crearà una clau d'autenticació vàlida per una hora.
2. **Registre del Node**: Per registrar un node, usa `tailscale up --login-server=URL_CONFIGURADA --auth-key=CLAU_OBTENIDA`. Substitueix `URL_CONFIGURADA` pel valor de `server_url` i `CLAU_OBTENIDA` per la clau generada en l'anterior pas. 
