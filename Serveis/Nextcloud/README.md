# Abans

Si no heu llegit el document de [Com Utilitzar Docker Compose](https://github.com/Otorexer/SerLliure/tree/main/Tutorials/ComUtilitzarDockerCompose), és molt recomanable que ho llegiu per saber què esteu fent en tot moment.

# Instal·lació

Per instal·lar **Nextcloud**, hem de copiar aquest Docker Compose i enganxar-lo al fitxer que hem creat a l'apartat de serveis.

```yaml
nextcloud:
  image: nextcloud
  container_name: nextcloud
  restart: always
  ports:
    - "11280:80" # El port en el qual podràs accedir a NextCloud.
  environment:
    - MYSQL_HOST=nextcloud-database # Canviar si es canvia el nom de la Base de Dades.
    - MYSQL_DATABASE=nextcloud # No tocar. Base de dades utilitzada a MySQL.
    - MYSQL_USER=nextcloud # No tocar. Usuari de MySQL.
    - MYSQL_PASSWORD= # Afegir contrasenya de MySQL.
    - TRUSTED_PROXIES=0.0.0.0/0 # No tocar. Perquè funcioni amb qualsevol proxy.
  volumes:
    - /ruta/a/nextcloud:/var/www/html # Afegit. Ruta on es guardarà el NextCloud.

nextcloud-database:
  image: mysql
  container_name: nextcloud-database
  restart: always
  environment:
    - MYSQL_DATABASE=nextcloud # No tocar. Base de dades utilitzada a MySQL.
    - MYSQL_USER=nextcloud # No tocar. Usuari de MySQL.
    - MYSQL_PASSWORD= # Afegir contrasenya de MySQL. Ha de ser la mateixa que la del contenidor de NextCloud.
    - MYSQL_ROOT_PASSWORD= # Afegit. Contrasenya Root MySQL. Pot ser la mateixa, però és recomanable que sigui més segura.
  volumes:
    - /ruta/a/mysql:/var/lib/mysql # Afegit. Ruta on es guardarà la Base de Dades MySQL
```

# Utilització de Caddy

Si utilitzem [Caddy](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Caddy) és important treure aquests paràmetres del Docker Compose, ja que Caddy s'ocupa de redirigir el tràfic cap a Nextcloud de forma més segura, ja que tot estarà encriptat amb HTTPS.

```bash
    ports:
      - "11280:80"
```

Un cop hem tret això, hem d'afegir el següent al **Caddyfile**.

```bash
elvostredomini {
  reverse_proxy nextcloud:80
}
```

D'aquesta forma podrem accedir a Nextcloud de forma encriptada i sense especificar el port.

# Configuració

Un cop tinguem tot això fet, ja podem iniciar el contenidor amb:

```bash
docker compose up -d --remove-orphans
```

Després, per accedir a Nextcloud, podem utilitzar la IP del nostre servidor i el port 11280. Si hem utilitzat Caddy, només hem de posar el nom de domini que li hem assignat.