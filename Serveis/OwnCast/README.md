# Abans
Si no heu llegit el document de [Com Utilitzar Docker Compose](https://github.com/Otorexer/SerLliure/tree/main/Tutorials/ComUtilitzarDockerCompose), és molt recomanable que ho llegiu per saber què esteu fent en tot moment.

# Instal·lació
Per instal·lar **Caddy**, hem de copiar aquest Docker Compose i enganxar-lo al fitxer que hem creat al apartat de serveis.

```yaml
  owncast:
    container_name: owncast
    image: owncast/owncast
    restart: always
    ports:
      - "1935:1935"
    volumes:
      - /etc/owncast:/app/data
```

# Utilització de Caddy
Si utilitzem [Caddy](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Caddy), és important treure aquests paràmetres del Docker Compose, ja que Caddy s'encarrega de redirigir el tràfic cap a OwnCast de forma més segura, ja que tot estarà encriptat amb HTTPS.

```bash
elvostredomini {
  reverse_proxy owncast:8080
}
```

D'aquesta forma podrem accedir a Nextcloud de forma encriptada i sense especificar el port.

# Configuració
Un cop tinguem tot això fet, ja podem iniciar el contenidor amb:

```bash
docker compose up -d --remove-orphans
```
# Accedir
Usuari: admin
Contrasenya: abc123

I cnaviarem la contrasenya des de 