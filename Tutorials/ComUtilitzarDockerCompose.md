# Com funciona Docker Compose
Docker Compose es una eina que ens permet mantenir tots els contenidors de docker que estem excutant i volem executar en un fitxer anomenat "**docker-compose.yml**".

En aquest fitxer es guardarden els parametres de tots els contenidors com la configuracio dels contenidors, els volums, les xarxes, les variables...

Es molt important mantenir aquest fitxer en un llocs seguir ja que hi posarem contrasenyes de serveis que ho nessesites com per exemple les Bases de Dades.

Per ultim sempre tenim que fer una copia d'aquest fitxer cada vegada que actualitzem alguna cosa ja que es el que ens permetra tornar a obrir el contenidor amb la mateixa configuracio per migrar el contenidor a una altre maquina o si perdem el servidor tornar a restaurar els contenidors amb les mateixes caracteristiques.


# Crear el fitxer
Per utilitzar docker compose primer de tot tenim que crear un fitxer que es dira "**docker-compose.yml**", aixo ho podem fer amb el comando de "**nano docker-compose.yml**".
```bash
nano docker-compose.yml
```

Un cop hem create el fitxer hi enganxarem lo seguent.
```bash
version: '3.1' # Especifica la versio de docker compose que s'esta utilitzant.

services: # Aqui es posaren tots els servesi que volguem executar al servidor.

volumes: # Tots els volums que utlizaran els contenidors.
```
Aquest es la configuracio basica que tenen que tenir tots els fitxer de Docker Compose perque puguin funcionar de forma correcte.
