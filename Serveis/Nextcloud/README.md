# Abans
Si no eu llegit el document de [Com Utilitzar Docker Compose](https://github.com/Otorexer/SerLliure/blob/main/Tutorials/ComUtilitzarDockerCompose.md) es molt recomena


# Instalacio
Per instalar **NextCloud** tenim que copiar el fitxer docker compse i enganxar-lo al ftixer que hem creat.

[Fitxer Docker Compose.
](https://github.com/Otorexer/SerLliure/blob/main/Serveis/Nextcloud/docker-compose.yml)


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
