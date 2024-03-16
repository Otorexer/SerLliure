# Abans
Si no eu llegit el document de [Com Utilitzar Docker Compose](https://github.com/Otorexer/SerLliure/blob/main/Tutorials/ComUtilitzarDockerCompose.md) es molt recomena


# Instalacio
Per instalar **exemple** tenim que copiar aquest docker compse i enganxar-lo al ftixer que hem creat.
```bash
  caddy:
    image: caddy
    container_name: caddy
    restart: always
    ports:
      - "80:80"
      - "443:443"
      - "443:443/udp"
    volumes:
      - /etc/caddy/:/etc/caddy/
      - caddy_data:/data
      - caddy_config:/config
```


# Configuracio
