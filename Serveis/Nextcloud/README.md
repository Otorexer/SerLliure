# Abans
Si no eu llegit el document de [Com Utilitzar Docker Compose](https://github.com/Otorexer/SerLliure/blob/main/Tutorials/ComUtilitzarDockerCompose.md) es molt recomendable que ho llegiu per saber que esteu fent en tot moment.


# Instalacio
Per instal·lar **Nextcloud**, hem de copiar aquest Docker Compose i enganxar-lo al fitxer que hem creat al apartat de serveis.

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
      - :/var/www/html # Afegit. Ruta on es guardarà el NextCloud.

  nextcloud-database:
    image: mysql
    container_name: nextcloud-database
    restart: always
    environment:
      - MYSQL_DATABASE=nextcloud # No tocar. Base de dades utilitzada a MySQL.
      - MYSQL_USER=nextcloud # No tocar. Usuari de MySQL.
      - MYSQL_PASSWORD= # Afegir contrasenya de MySQL. Ha de ser la mateixa que la del contenidor de NextCloud.
      - MYSQL_ROOT_PASSWORD= #Afegit Contrasenya Root MySQL. Pot ser la mateix pero es recomandable que sigui mes segura.
    volumes:
      - :/var/lib/mysql #Es te que afegir. Ruta a on es guardata la Base de Dadees MySQL
```



# Utilitzacio de Caddy
Si utilitzem [Caddy](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Caddy) es important treure aquets parametres del Docker Compose. Ja que caddy s'ocupa de redirecionar el trafic cap a NextCloud de forma mes segura ja que tot estara encriptat amb Https.
```bash
    ports:
      - "11280:80" #El port en que podras accedir a NextCloud.
```

Un cop hem tret aixo tindrem que afegir lo seguent a el **Caddyfile**.
```bash
elvostredomini {
  reverse_proxy nextcloud:80
}
```
D'aquesta forma podrem accedir a Nextcloud de forma encriptada i sense especificar el port.


# Configuracio
Un cop tinguem tot aixo fet ja podem iniciar el Contenidor amb:
```bash
docker compose up -d --remove-orphans
```

Despres per accedir a NextcCloud podem la Ip del nostre servidor hi el port 11280, si hem utilitzat Caddy domes tenim que posar el nom de Domin que li hem assignat.
