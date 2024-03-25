# Abans
Si no heu llegit el document de [Com Utilitzar Docker Compose](https://github.com/Otorexer/SerLliure/blob/main/Tutorials/ComUtilitzarDockerCompose.md), és molt recomanable que ho llegiu per saber què esteu fent en tot moment.

# Instal·lació
Per instal·lar **Caddy**, hem de copiar aquest Docker Compose i enganxar-lo al fitxer que hem creat al apartat de serveis.

```yaml
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

Després, hem de copiar aquests volums a la secció de volums.

```yaml
volumes:
  caddy_data: # Caddy Volume
  caddy_config: # Caddy Volume
```

# Configuració
Ja podem iniciar el contenidor amb:

```bash
sudo docker-compose up -d --remove-orphans
```

Ara crearem el fitxer "Caddyfile" per guardar tota la configuració.

```bash
sudo touch /etc/caddy/Caddyfile
```

Per editar la configuració podem fer servir:

```bash
sudo nano /etc/caddy/Caddyfile
```

Si editem la configuració de Caddy i volem que s'apliqui, hem de executar la següent comanda:

```bash
docker exec caddy caddy reload --config /etc/caddy/Caddyfile
```

## Exemples de configuracions
### Punts importants
Abans de crear una nova reverse proxy, hem de configurar el nostre domini amb un nou Registre DNS apuntant a la IP pública del servidor de Caddy. Podeu trobar molts tutorials a YouTube sobre com fer-ho.

**elteudomini.com:** Aquí hem de posar el domini o subdomini que volem configurar per on la gent accedirà a aquest servei que prèviament hem creat el Registre DNS.

**dnsLocal:** Aquí configurarem la dnsLocal de Tailscale o Headscale on està allotjat el servei perquè el servidor de Caddy ho pugui redirigir al servidor corresponent.

Si hem seguit el tutorial d'aquest repositori per instal·lar Headscale, el dnsLocal serà similar al següent: nomEquip.nomUsuari.local.

**port:** Aquí posarem el port on es troba el servei. A cada tutorial posem a quin port es configuren per defecte els serveis, per tant, hem de posar això.

Per exemple, Webmin està configurat amb el port 10000.

### Bàsica amb DNS
Una configuració bàsica del Caddy seria aquesta:

```bash
elteudomini.com {
    reverse_proxy (dnsLocal):(port)
}
```

Aquesta configuració crea un reverse proxy al servei que tu li assignis.

### Bàsica amb IP
>[!WARNING]
>No recomanem configurar res d'aquesta forma ja que no és pràctic i només podem tenir un servei allotjat a la vegada.

Una configuració bàsica del Caddy amb IP seria aquesta:

```bash
:80 {
    reverse_proxy (dnsLocal):(port)
}
```

Aquesta configuració crea un reverse proxy al servei que tu li assignis.

### Avançada amb DNS
Aquesta configuració és molt especial ja que permet crear reverse proxies amb serveis que ja tenen certificats HTTPS creats com podria ser Webmin.

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

Si intentem accedir a Webmin amb la configuració bàsica, ens sortirà aquest error que no ens permetrà accedir a Webmin.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/e531fa58-50f9-44a6-8859-affb239612c3)

Però si en canvi fem servir la configuració avançada, podem veure com ja podrem entrar de forma normal.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/3bca2670-6f7a-41c4-8d65-af33f97cfd79)
