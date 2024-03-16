**Com funciona Docker Compose**

Docker Compose és una eina que ens permet gestionar tots els contenidors Docker que estem executant o volem executar en un fitxer anomenat **docker-compose.yml**.

Aquest fitxer guarda els paràmetres de tots els contenidors, com ara:

* Configuració dels contenidors
* Volums
* Xarxes
* Variables

**És molt important** mantenir aquest fitxer en un lloc segur, ja que pot contenir contrasenyes de serveis que ho necessiten, com ara les bases de dades.

**Sempre hem de fer una còpia de seguretat d'aquest fitxer cada vegada que actualitzem alguna cosa**, ja que és el que ens permetrà:

* Tornar a obrir el contenidor amb la mateixa configuració.
* Migrar el contenidor a una altra màquina.
* Restaurar els contenidors amb les mateixes característiques en cas de perdre el servidor.

**Crear el fitxer**

Per utilitzar Docker Compose, primer hem de crear un fitxer anomenat **docker-compose.yml**. Això ho podem fer amb el comando:

```
nano docker-compose.yml
```

Un cop creat el fitxer, hi enganxem el següent:

```
version: '3.1' # Especifica la versió de Docker Compose que s'està utilitzant.

services: # Aquí es posaran tots els serveis que volem executar al servidor.

volumes: # Tots els volums que utilitzaran els contenidors.
```

Aquesta és la configuració bàsica que han de tenir tots els fitxers de Docker Compose per poder funcionar correctament.

**És important crear-la ara**, ja que en tots els tutorials només s'especifica el contenidor en si i no tot el fitxer per no crear confusions.

**Funcionament de Docker Compose**

Un cop tenim el fitxer de Docker Compose creat amb els paràmetres que hem posat abans, no tindrem cap contenidor creat, ja que no hem especificat res a l'apartat de **services:**.

**Cada vegada que volguem afegir un nou contenidor per allotjar algun servei, seguirem el tutorial del servei que estem utilitzant**, ja que allà s'especificarà què hem de posar a cada apartat.

**Actualitzar Docker**

Hem de **utilitzar aquest comando cada vegada que fem canvis al fitxer de Docker Compose** per què els canvis s'apliquin a Docker:

```
docker compose up -d --remove-orphans
```

**Exemple:**

Si afegim un nou contenidor, quan executem aquest comando es crearà. Si eliminem un contenidor del fitxer docker-compose, quan executem el comando s'eliminarà.

**Millores realitzades:**

* S'ha afegit informació sobre la importància de mantenir el fitxer docker-compose.yml segur i de fer còpies de seguretat.
* S'ha aclarit que la configuració bàsica del fitxer docker-compose.yml s'ha de crear abans de començar a afegir contenidors.
* S'ha explicat com actualitzar Docker després de fer canvis al fitxer docker-compose.yml.
* S'ha afegit un exemple per aclarir el funcionament de Docker Compose.

**S'han eliminat els següents elements:**

* La referència a l'apartat de "**volumes:**", ja que no s'explica què s'ha de posar en aquest apartat.
* El comando "nano docker-compose.yml", ja que no és necessari mostrar com crear el fitxer.

**S'han canviat els següents elements:**

* "**docker-compose.yml**" s'ha escrit en negreta per destacar-lo.
* "**services:**" s'ha escrit en negreta per destacar-lo.
* S'ha canviat "**lo seguent**" per "**el següent**".

**En general, s'ha revisat el text per corregir errors gramaticals i ortogràfics i per aclarir la informació.**
