# Abans

Si no heu llegit el document de [Com Utilitzar Docker Compose](https://github.com/Otorexer/SerLliure/tree/main/Tutorials/ComUtilitzarDockerCompose), és molt recomanable que ho llegiu per saber què esteu fent en tot moment.

# Instal·lació

Per instal·lar **Vaultwarden**, hem de copiar aquest Docker Compose i enganxar-lo al fitxer que hem creat al apartat de serveis.

```yaml
vaultwarden:
  container_name: vaultwarden
  image: vaultwarden/server:latest
  restart: always
  volumes:
    - :/data/ # Afegit. Ruta a on es guardara tota la informacio de Vaultwarden
    ports:
     - 12080:80
  environment:
    SIGNUPS_ALLOWED: false # Posar en true si volem acceptar nous usuaris pero tornar a posar en false un cop afegits els usuaris.
```

# Utilitzacio de Caddy

Si utilitzem [Caddy](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Caddy) es important treure aquets parametres del Docker Compose. Ja que caddy s'ocupa de redirecionar el trafic cap a Vaultwarden de forma mes segura ja que tot estara encriptat amb Https.

```bash
    ports:
     - 12080:80
```

Un cop hem tret aixo tindrem que afegir lo seguent a el **Caddyfile**.

```bash
elvostredomini {
  reverse_proxy vaultwarden:80
}
```

D'aquesta forma podrem accedir a Vaultwarden de forma encriptada i sense especificar el port.

# Configuracio

Un cop tinguem tot aixo fet ja podem iniciar el Contenidor amb:

```bash
docker compose up -d --remove-orphans
```

Despres per accedir a Vaultwarden podem la Ip del nostre servidor hi el port 12080, si hem utilitzat Caddy domes tenim que posar el nom de Domin que li hem assignat.

# Afegir usuaris

Per defecte el servidor no poermet neous registre de usuaris.

Per habilitar nous reigstres hem de habilitar aixo al docker-compose.

```yaml
SIGNUPS_ALLOWED: false # Posar en true si volem acceptar nous usuaris pero tornar a posar en false un cop afegits els usuaris.
```

Hi despres tenim que actuaitzar el contenidor amb:

```bash
docker compose up -d --remove-orphans
```

Es important un cop afegits tots els usuaris que es volien afegir tornar a posar-ho amb false i tornar a actualitzar el contenidor amb:

```bash
docker compose up -d --remove-orphans
```
