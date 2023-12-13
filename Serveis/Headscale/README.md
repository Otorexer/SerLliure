# Instal·lació
Per instal·lar Headscale només hem d'executar aquest comandament.
```bash
wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Headscale/I-Headscale.sh && bash I-Headscale.sh && rm I-Headscale.sh
```
## Reverse Proxy
Un cop tenim el headscale instalat tenim que crear un Reverse Proxy amb Caddy aquest script ens crara la configuracio automaticament amb el nom de domini que haguem posat anteriormanet.

```bash
wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Headscale/Headscale-Caddy.sh && bash Headscale-Caddy.sh && rm Headscale-Caddy.sh
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
El ID del node el podem trobar si fem el comande per veure tots els Nodes i el nom de usuari si no ens en recordem 
```bash
headscale nodes mv -i (ID_Node) -u (Usuari_Nou)
```
