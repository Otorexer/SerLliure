# Abans

Si no heu llegit el document [Com Utilitzar Docker Compose](https://github.com/Otorexer/SerLliure/tree/main/Tutorials/ComUtilitzarDockerCompose), és molt recomanable que ho llegiu per saber què esteu fent en tot moment.

## Instal·lació

Per instal·lar **Portainer**, hem de copiar aquest Docker Compose i enganxar-lo al fitxer que hem creat al apartat de serveis.

```yaml
  portainerce:
    container_name: portainerce
    image: portainer/portainer-ce:latest
    restart: always
    ports:
      - 9443:9443 # Port HTTP
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock # No tocar. Nessesari perque Portainer tingu acces als contenidos de Docker
      - portainer_data:/data # No tocar. Volum on es guardara la configuracio de Portainer
```

Després, hem de copiar aquests volums a la secció de volums.

```yaml
  portainer_data: # Portainer Volume
```

## Utilització de Caddy

Si utilitzem [Caddy](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Caddy) és important treure aquests paràmetres del Docker Compose, ja que Caddy s'ocupa de redirigir el tràfic cap a Portainer de forma més segura ja que tot estarà encriptat amb HTTPS.

```bash
ports:
  - 9443:9443 # Port HTTP
```

Un cop hem tret això, haurem d'afegir el següent al **Caddyfile**.

```bash
elvostredomini {
  reverse_proxy portainerce:9443 {
    transport http {
      tls_insecure_skip_verify
    }
  }
}
```

D'aquesta forma podrem accedir a Portainer de forma encriptada i sense especificar el port.

## Configuració

Ja podem iniciar el contenidor amb:

```bash
sudo docker compose up -d --remove-orphans
```

Després, hem d'obrir Portainer especificant el domini o la IP amb el port, i crear un nou compte.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/21fbb4d3-ae2c-4aee-8404-73211f2d8a6b)

I ja podrem administrar els nostres contenidors de forma web.