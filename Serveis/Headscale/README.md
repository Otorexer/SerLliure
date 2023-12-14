# Instal·lació
Per instal·lar Headscale només hem d'executar aquest comandament.
```bash
rm -f I-Headscale.sh && wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Headscale/I-Headscale.sh && bash I-Headscale.sh && rm I-Headscale.sh
```
## Base de dades
```bash
rm -f Headscale-Database.sh && wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Headscale/Headscale-Database.sh && bash Headscale-Database.sh && rm Headscale-Database.sh
```
## Reverse Proxy
Un cop tenim el headscale instalat tenim que crear un Reverse Proxy amb Caddy aquest script ens crara la configuracio automaticament amb el nom de domini que haguem posat anteriormanet.
```bash
rm -f Headscale-Caddy.sh && wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Headscale/Headscale-Caddy.sh && bash Headscale-Caddy.sh && rm Headscale-Caddy.sh
```
# Funcionament de Headscale
Headscale es una mica mes complicat de utilitzar ja que no te una web per administrar tots els ordinadors de forma facila, pero si que te una linia de comandes que es permet fer tot o mes coses que Tailscale.

## Usuaris
Els usuaris a Headscale son com el Usuaris a Tailscale pero aquesta vegada no estan limitats i no es te que pagar res ja que es gratis.

### Creacio Usuari
Per crear un usuari podem executar el seguent comande.
```bash
headscale users c (nom_usuari)
```
### Llista Usuaris
```bash
headscale users ls
```
### Renombrar Usuari
```bash
headscale users mv (nom_actual) (nom-nou)
```
### Eliminar Usuari
```bash
headscale users delete (nom_usuari)
```

## Nodes
Els Nodes a Headscale serien tots els equips conectats a la nostre xarxa a Tailscale serien les Maquines.

Tots els Nodes tenen que tenir un usuari vinculat a ell, aixo vol dir que si volem afegir un nou ordinador avanse tenim que haver cret un usuari.
### Veure tots els Nodes
```bash
headscale nodes ls
```
### Canviar d'usuari un Node
El ID del node el podem trobar si fem el comande per [Veure tots els Nodes](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Headscale#veure-tots-els-nodes) i el nom de usuari a lapartat de la [Llista Usuaris](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Headscale#llista-usuaris)
```bash
headscale nodes mv -i (ID_Node) -u (Usuari_Nou)
```
### Renombrar un Node
El ID del node el podem trobar si fem el comande per [Veure tots els Nodes](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Headscale#veure-tots-els-nodes)
```bash
headscale nodes rename (Nom_Nou) -i (ID_Node)
```
### Eliminar un Node
```bash
headscale nodes delete -i (ID_Node)
```
## Preauthkeys
Les Preauthkeys son claus per iniciar sessio al nostre servidor de Headscale sense tinguer que afegir cada usuari manualment tinguent que entrar al servidor cada vegada.
### Creacio Preauthkeys
Quant es crear una Clau es te que assignar a un Usuari ja que quant el Node se uneixi a la Xarxa safegira amb aquell usuari
```bash
headscale pre c -u (Nom_Usuari)
```
### Claus que te cada Usuari
```bash
headscale pre ls -u (Nom_Usuari)
```
### Expirar una Clau
Quant ens referim a la (Clau) ens referim a tot el text llarc no la ID, podem veure amb el comande per comprovar cada [clau de cada usuari](https://github.com/Otorexer/SerLliure/blob/main/Serveis/Headscale/README.md#claus-que-te-cada-usuari).
```bash
headscale pre exp (Clau) -u (Nom_Usuari)
```
