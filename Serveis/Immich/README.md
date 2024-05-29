# Abans

Si no heu llegit el document de [Com Utilitzar Docker Compose](https://github.com/Otorexer/SerLliure/tree/main/Tutorials/ComUtilitzarDockerCompose), és molt recomanable que ho llegiu per saber què esteu fent en tot moment.

# Instal·lació

Per instal·lar **Immich**, hem de copiar aquest Docker Compose i enganxar-lo al fitxer que hem creat a l'apartat de serveis.

```yaml
  immich-server:
    container_name: immich-server
    image: ghcr.io/immich-app/immich-server:release
    restart: always
    command: ['start.sh', 'immich']
    volumes:
      - /ruta/a/les/fotos:/usr/src/app/upload # Afegit. Ruta on es guardaran les fotos de Immich
      - /etc/localtime:/etc/localtime:ro
    ports:
      - 2283:3001
    depends_on:
      - immich-database
    environment:
      DB_HOSTNAME: immich-database
      DB_USERNAME: postgres # No tocar. Usuari de Postgres.
      DB_PASSWORD: # Afegir contrasenya de Postgres. Ha de ser la mateixa que la del contenidor.
      DB_DATABASE_NAME: immich # No tocar. Base de Dades de Postgres.
      REDIS_HOSTNAME: immich-redis

  immich-microservices:
    container_name: immich-microservices
    image: ghcr.io/immich-app/immich-server:release
    restart: always
    command: ['start.sh', 'microservices']
    volumes:
      - /ruta/a/les/fotos:/usr/src/app/upload # Afegit. Ruta on es guardaran les fotos de Immich
      - /etc/localtime:/etc/localtime:ro
    depends_on:
      - immich-database
    environment:
      DB_HOSTNAME: immich-database
      DB_USERNAME: postgres # No tocar. Usuari de Postgres.
      DB_PASSWORD: # Afegir contrasenya de Postgres. Ha de ser la mateixa que la del contenidor.
      DB_DATABASE_NAME: immich # No tocar. Base de Dades de Postgres.
      REDIS_HOSTNAME: immich-redis

  immich-machine-learning:
    container_name: immich-machine-learning
    image: ghcr.io/immich-app/immich-machine-learning:release
    restart: always
    volumes:
      - model-cache:/cache

  immich-redis:
    container_name: immich-redis
    image: registry.hub.docker.com/library/redis:6.2-alpine@sha256:84882e87b54734154586e5f8abd4dce69fe7311315e2fc6d67c29614c8de2672
    restart: always

  immich-database:
    container_name: immich-database
    image: registry.hub.docker.com/tensorchord/pgvecto-rs:pg14-v0.2.0@sha256:90724186f0a3517cf6914295b5ab410db9ce23190a2d9d0b9dd646>    
    restart: always
    environment:
      POSTGRES_PASSWORD:  # Afegir contrasenya de Postgres. Ha de ser la mateixa que la del contenidor.
      POSTGRES_USER: postgres # No tocar. Usuari de Postgres.
      POSTGRES_DB: immich # No tocar. Base de Dades de Postgres.
    volumes:
      - /ruta/a/les/basesdedades:/var/lib/postgresql/data # Afegit. Ruta on es guardaran les bases de dades Postgres
```

Després, hem de copiar aquest volum a la secció de volums.

```yaml
model-cache: # Volum d'Immich
```

# Utilització de Caddy

Si utilitzem [Caddy](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Caddy) és important treure aquests paràmetres del Docker Compose, ja que Caddy s'ocupa de redirigir el tràfic cap a Immich de forma més segura, ja que tot estarà encriptat amb HTTPS.

```bash
    ports:
      - 2283:3001
```

Un cop hem tret això, hem d'afegir el següent al **Caddyfile**.

```bash
elvostredomini {
    reverse_proxy immich-server:3001
}
```

D'aquesta forma podrem accedir a Immich de forma encriptada i sense especificar el port.

# Configuració

Un cop tinguem tot això fet, ja podem iniciar el contenidor amb:

```bash
docker compose up -d --remove-orphans
```

Després, per accedir a Immich podem utilitzar la IP del nostre servidor i el port 2283. Si hem utilitzat Caddy, només hem de posar el nom de domini que li hem assignat.