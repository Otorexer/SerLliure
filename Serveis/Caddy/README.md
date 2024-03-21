# Abans
Si no heu llegit el document de [Com Utilitzar Docker Compose](https://github.com/Otorexer/SerLliure/blob/main/Tutorials/ComUtilitzarDockerCompose.md), és molt recomanable que ho llegiu per saber què esteu fent en tot moment.

# Instal·lació
Per instal·lar **Caddy**, hem de copiar aquest Docker Compose i enganxar-lo al fitxer que hem creat al apartat de serveis.
```bash
  caddy:
    image: caddy
    container_name: caddy
    restart: always
    ports:
      - "80:80" # Port HTTP
      - "443:443" # Port HTTPS
      - "443:443/udp" # Port HTTPS
    volumes:
      - /etc/caddy/:/etc/caddy/ # No tocar. Ruta on hi haurà la configuració de Caddy
      - caddy_data:/data # No tocar. Volum per a que funcioni Caddy
      - caddy_config:/config # No tocar. Volum per a que funcioni Caddy
```

Despres tenim que copiar aquest volumes al apartat de volums.
```bash
  caddy_data: # Caddy Volume
  caddy_config: # Caddy Volume
```


# Configuració
Ara crearem el fitxer "Caddyfile" per guardar tota la configuracio.
```bash
sudo touch /etc/caddy/Caddyfile
```

Per editar la configuració podem fer servir
```bash
sudo nano /etc/caddy/Caddyfile
```

Un cop tinguem tot això fet, ja podem iniciar el contenidor amb:
```bash
sudo docker compose up -d --remove-orphans
```


## Exemples de configuracions
### Punts importants
Avans de crear una nova reverse proxy tenim que configurar el nostre Domini amb un nou Registre DNS apuntant a la IP Public del Servidor de Caddy, podem trobar molts tutorials al youtube de com fer-ho.

**elteudomini.com:** Aqui tenim que posar el domini o subdomini que volem configurar per on la gent accedirar en aquest servei que previament hem creat el Registre DNS.

**dnsLocal:** Aqui configurarem la dnsLocal de Tailscale o Headscale on esta allotjat el servei perque el servidor de Caddy ho pugui redireccionar al servidor corresponent.

Si hem seguit el tutorial d'aquest Repositori per instalar Headscale el dnsLocal sera similar al seguent: nomEquip.nomUsuari.local.

**port:** Aqui posarem el port on el troba el Servei. A cada tutorial posem a quin port es configuren per defecte els Serveis, doncs tenim que posar allo.

Per exemple Webmin esta configurat amb el port 10000.

### Basica amb DNS
Una configuracio basica del Caddy seria aquesta.
```bash
elteudomini.com {
    reverse_proxy (dnsLocal):(port)
}
```

Aquesta configuracio crea un reverse proxy al Servei que tu li assignes.

### Basica amb IP
>[!WARNING]
>No recomanem configurar res d'aquesta forma ja que no es practic hi domes podem tenir 1 servei allotat a la vegada.

Una configuracio basica del Caddy amb IP seria aquesta.
```bash
:80 {
    reverse_proxy (dnsLocal):(port)
}
```

Aquesta configuracio crea un reverse proxy al Servei que tu li assignes.

### Avançada amb DNS
Aquesta configuracio es molt especial ja que permet crear reverse Proxys amb Serveis que ja tenen certificats HTTPS creats com podria Ser Webmin.

```bash
elteudomini.com {
    reverse_proxy (dnsLocal):(port) {
        transport http {
            tls_insecure_skip_verify 
        }
    }
}
```

Exemple:

Si intentem accedir a Webmin amb la configuracio basica ens sortira aquest error que no ens permetra accedir a Webmin.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/e531fa58-50f9-44a6-8859-affb239612c3)

Pero si en canvi fem servir la configuracio Acançada podem veure com ja podrem entrar de forma normal.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/3bca2670-6f7a-41c4-8d65-af33f97cfd79)
