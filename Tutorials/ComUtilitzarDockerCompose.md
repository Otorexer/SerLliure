# Com funciona Docker Compose
Docker Compose es una eina que ens permet mantenir tots els contenidors de docker que estem excutant i volem executar en un fitxer anomenat "**docker-compose.yml**".

En aquest fitxer es guardarden els parametres de tots els contenidors com la configuracio dels contenidors, els volums, les xarxes, les variables...

Es molt important mantenir aquest fitxer en un llocs seguir ja que hi posarem contrasenyes de serveis que ho nessesites com per exemple les Bases de Dades.

Per ultim sempre tenim que fer una copia d'aquest fitxer cada vegada que actualitzem alguna cosa ja que es el que ens permetra tornar a obrir el contenidor amb la mateixa configuracio per migrar el contenidor a una altre maquina o si perdem el servidor tornar a restaurar els contenidors amb les mateixes caracteristiques.


# Crear el fitxer
Per utilitzar docker compose primer de tot tenim que crear un fitxer que es dira "**docker-compose.yml**" aquest fitxer es a on sespecificara tots els parametre que estara utilizant el nostre docker.

Es molt important mantenir una copa d'aquest fitxer ja que es el encargat de guardar tots els parametre que fa servir docker
