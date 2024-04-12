# Abans
Si no heu llegit el document de [Com Utilitzar Docker Compose](https://github.com/Otorexer/SerLliure/tree/main/Tutorials/ComUtilitzarDockerCompose), és molt recomanable que ho llegiu per saber què esteu fent en tot moment.

# Instal·lació
Per instal·lar **exemple**, hem de copiar aquest Docker Compose i enganxar-lo al fitxer que hem creat.

Fitxer Docker Compose

# Utilització de Caddy
Si utilitzem [Caddy](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Caddy), és important treure aquests paràmetres del Docker Compose, ja que Caddy s'encarrega de redirigir el tràfic cap a NextCloud de forma més segura, ja que tot estarà encriptat amb HTTPS.

```bash

```

Un cop hem tret això, haurem d'afegir el següent al **Caddyfile**.

```bash
elvostredomini {
  reverse_proxy 
}
```

D'aquesta forma podrem accedir a Nextcloud de forma encriptada i sense especificar el port.

# Configuració
Un cop tinguem tot això fet, ja podem iniciar el contenidor amb:

```bash
docker compose up -d --remove-orphans
```
