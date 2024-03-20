# Abans
Si no eu llegit el document de [Com Utilitzar Docker Compose](https://github.com/Otorexer/SerLliure/blob/main/Tutorials/ComUtilitzarDockerCompose.md) es molt recomendable que ho llegiu per saber que esteu fent en tot moment.


# Instalacio
Per instalar **exemple** tenim que copiar aquest docker compse i enganxar-lo al ftixer que hem creat.

Fitxer Docker Compose.


# Utilitzacio de Caddy
Si utilitzem [Caddy](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Caddy) es important treure aquets parametres del Docker Compose. Ja que caddy s'ocupa de redirecionar el trafic cap a NextCloud de forma mes segura ja que tot estara encriptat amb Https.
```bash

```

Un cop hem tret aixo tindrem que afegir lo seguent a el **Caddyfile**.
```bash
elvostredomini {
  reverse_proxy 
}
```
D'aquesta forma podrem accedir a Nextcloud de forma encriptada i sense especificar el port.


# Configuracio
Un cop tinguem tot aixo fet ja podem iniciar el Contenidor amb:
```bash
docker compose up -d --remove-orphans
```
