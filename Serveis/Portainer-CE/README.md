# Abans
Si no heu llegit el document de [Com Utilitzar Docker Compose](https://github.com/Otorexer/SerLliure/tree/main/Tutorials/ComUtilitzarDockerCompose), és molt recomanable que ho llegiu per saber què esteu fent en tot moment.

# Instal·lació
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

# Configuració
Ja podem iniciar el contenidor amb:

```bash
sudo docker compose up -d --remove-orphans
```
