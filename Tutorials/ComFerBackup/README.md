# Docker Compose

Per fer backup dels contenidors de Docker, podem copiar el fitxer **docker-compose.yml**.

Aquest fitxer el podem desar en algun lloc segur per tornar a restaurar els contenidors si el servidor té algun problema o per fer la migració de serveis entre servidors.

Amb el fitxer de Docker Compose només es guarda la configuració dels contenidors, no les dades dels volums assignats. Per això, si volem guardar també els arxius, hem de guardar el volum.

# Volums de Docker

Per guardar els volums de Docker, es recomanable seguir aquests passos:

Primer de tot, hem de parar el contenidor de Docker per assegurar-nos que no hi hagi dades corruptes.

```bash
docker stop nomcontenidor
```

Un cop el contenidor està aturat, podem crear un fitxer comprimit utilitzant `tar` per ocupar el mínim espai possible i guardar totes les propietats de les carpetes.

Abans de tot, però, hem d'entrar al directori que volem guardar, ja que per defecte la comanda `tar` guarda la ruta absoluta.

```bash
cd directori
```

```bash
tar -czvf directoriarxiubackup.tar.gz *
```

D'aquesta manera, es guardarà tot el contingut del directori actual en un fitxer .tar.gz amb tot el contingut.

Finalment, per acabar, podem tornar a iniciar el contenidor de Docker.

```bash
docker start nomcontenidor
```

# Caddy

També és recomanable tenir un backup de **Caddy** per si el servidor té algun problema o si volem migrar el servidor.

Si hem seguit el tutorial, aquest fitxer es trobarà a:

```bash
/etc/caddy/Caddyfile
```

Aquest fitxer el podem desar en algun lloc segur per tornar a restaurar el servidor de Caddy si el servidor té algun problema o per fer la migració de servidors.

# Script automàtic

Hem creat un script automàtic per a tots aquests processos de forma autònoma, el qual podem executar de forma periòdica.

Per utilitzar aquest script, només hem de crear un fitxer al servidor.

```bash
sudo nano /root/backup.sh
```

[Hi copiarem el contingut d'aquest script](https://raw.githubusercontent.com/Otorexer/SerLliure/main/Tutorials/ComFerBackup/backup.sh)

Despres li donarem permisos d'execucio en aquest script

```bash
sudo chmod +x /root/backup.sh
```

En aquest script hi ha diverses variables:

```bash
USER=""
PASSWD=""
SERVER=""
SERVER_BACKUP_DIR=""
```

Primer de tot, hem de editar aquestes variables. A les tres primeres, hem de posar les dades d'inici de sessió que utilitzaríem per connectar-nos al servidor amb SSH, ja que en aquest cas utilitzarem **rsync** per sincronitzar arxius entre servidors.

Després, hem de editar el "SERVER_BACKUP_DIR". Aquí hi posarem el directori del servidor on es guardaran les còpies, tenint en compte que l'usuari amb què ens connectem ha de tenir permisos a la carpeta.

```bash
DOCKER_STOP=(

)

ROUTE=(

)
```

Per acabar, hem de editar aquestes arrays.

A la primera, hi posarem tots els contenidors de Docker que volem aturar perquè les dades no es corrompin.

A la segona array, hi posarem la ruta dels directoris que volem fer la còpia de seguretat. Aquests directoris els podem trobar al fitxer de Docker Compose on hem establert les rutes.

**És molt important que els valors que posem a l'array estiguin entre cometes " ".**

Un exemple de configuracio podria ser aquest

```bash
DOCKER_STOP=(
"headscale-database"
)

ROUTES=(
"/etc/headscale-database"
)
```

Ja que en aquest cas estem parant la base de dades de headscale hi estem copiant la ruta on es trova enmagatzemada la base de dades.

Doncs aixo ho tindriem que fer amb tot el que volguem fer backup.

# Backup periodic

Per fer que aquest script de backup s'executi de forma periodica cada diumentje a les 4 de la nit podem fer el seguent.

Primer de tot verificarem que tinguem cron intalat

```bash
sudo apt install cron -y
```

Despres accedirem a la configuracio de crontab amb.

```bash
sudo crontab -e
```

Hi per acavar afegirem aquesta linea de codi al final del arxiu

```bash
0 4 * * 0 /root/backup.sh
```
