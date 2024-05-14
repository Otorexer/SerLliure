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
tar -czvf directoriarchivebackup.tar.gz *
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
Aquest fitxer el podem desar en algun lloc segur per tornar a restaurar el servidor de Caddy si el servidor té algun problema o per fer la migració de serveis.

# Script automàtic
Hem creat un script automàtic per a tots aquests processos de forma autònoma, el qual podem executar de forma periòdica.
Per utilitzar aquest script, només hem de crear un fitxer al servidor.
```bash
sudo nano /root/backup.sh
```

[Hi copiarem el contingut d'aquest script](https://raw.githubusercontent.com/Otorexer/SerLlienceia/master/docs/README.md) (només que no hi ha cap problema amb els comandes)

Doncs això ho tindriem que fer amb tot el que volguem fer backup.

# Backup periodic
Per fer que aquest script de backup s'executi de forma periodica cada dia al vespre a les 4 de la nit podem fer el següent.
Primer de tot verificarem que tinguem cron instal·lat.
```bash
sudo apt install cron -y
```
Després accedirem a la configuració de crontab amb.
```bash
sudo crontab -e
```
Hi per acabar afegirem aquesta línia de codi al final del arxiu.
```bash
0 4 * * 0 /root/backup.sh
```
