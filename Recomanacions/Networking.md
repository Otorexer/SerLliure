#### Accedir al servidor de forma privada
Recomanem instal·lar Tailscale per accedir al servidor de manera privada, permetent l'accés a través de la xarxa local o pública sense necessitat d'obrir ports al router.

La principal avantatge de Tailscale és que opera com una VPN Mesh, la qual cosa significa que la connexió sempre és directa entre el servidor i un client, sense passar per un servidor intermediari. Així, Tailscale es dedica principalment a administrar els dispositius de la xarxa i assegurar la correcta vinculació entre ells.

[Explicació Completa](https://tailscale.com/blog/how-tailscale-works/)
#### Accedir al servidor de forma pública
Si desitgem que tot internet pugui accedir al nostre servidor, tenim dues opcions:

La primera opció és obrir ports al nostre router, la qual és l'opció més típica i senzilla, amb nombrosos tutorials disponibles a YouTube.

La segona opció consisteix en contractar una VPS amb una IP pública, on instal·larem un proxy per a l'accés públic al servidor. Utilitzarem dos serveis: NginxProxy per a servidors que operen amb HTTP i HTTPS, ja que permet sol·licitar certificats SSL fàcilment amb CertBot, i Fast Reverse Proxy per a enrutament de ports TCP i UDP, útil per a serveis que no són HTTP, com ara Samba (que necessita del port 445) o un servidor de jocs com Minecraft (que requereix del port 25565).

#### DNS
Per facilitar l'accés al servidor, utilitzarem servidors DNS. Recomanem tenir dos DNS: un públic i un privat.

##### DNS Públic
El DNS públic es pot configurar comprant un domini propi o utilitzant subdominis gratuïts que ofereixen algunes pàgines.

##### DNS Privat
Per al DNS privat, es pot utilitzar el de Tailscale, encara que ofereix poc control i no es molt facil de enrecordar. Recomanem crear un propi servidor DNS amb AdGuard i Bind per aquesta forma tenir una protecio i Dominis Privat bonics i facils de controlar.
