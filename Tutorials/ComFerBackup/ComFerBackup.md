# Docker Compose
Per fer backup de els contenidors de Docker podem copiar el arxiu de **docker-compose.yml**

Aquest arxiu el podem guardar en algun lloc segur per tornar a restaurar els contenidors per si el servidor te algun problema o per fer la migracio de serveis entre servidors.

Amb el fitxer de docker compose domes es guarda la configuracio dels conetnidors no les dades dels volums asignats per aixo so volem guardar arxius tambe tenim que guardar el volum.

# Volums Docker
Per guardar volums de docker es recomanable seguir aquest pasos.

Primer de tot tenim que parar el contenidor de docker per assegurar-nos que no hi auran dades corruptes

```bash
docker stop nomcontenidor
```

Un cop el contenidor parat podem crear un arxiu comprimit utilitzant tar per ocupar el minim espai possible hi guardar totes les propietats de les carpetes 

Pero primer de tot tenim que entrar al directori que volem guardar ja que per defecte el comando de tar guarda la ruta absoluta

```bash
cd directori
```

```bash
tar -czvf directoriarxiubackup.tar.gz *
```

D'aquesta forma es guardara tot el contingut del directori que estem ara mateix a un arxiu .tar.gz amb tot el contingut.

Hi per acavar ja podem tornar a inciar el contenidor de docker
```bash
docker start nomcontenidor
```

# Caddy
Tambe es recomendable tenir un backup de **Caddy** per si el servidor te algun problema o si volem migrar el servidor.

Si hem seguit el tutorial aquest fitxer es trovara a
```bash
/etc/caddy/Caddyfile
```

Aquest arxiu el podem guardar en algun lloc segur per tornar a restaurar el servidor de Caddy per si el servidor te algun problema o per fer la migracio de servidors.

# Script automatic
Hem creat un script automatic per tots aquest processos de forma autonoma i que el podem executar de forma periodica.

Per utilitzar aquest script domes tenim que crear un arxiu al servidor.
```bash
sudo nano /root/backup.sh
```
Hi copiarem el contingut d'aquest script