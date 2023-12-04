# Recomanacions
En aquest apartat fem unes recomenacions que per nosaltres serien per fer el servidor perfecte tant amb seguretat com amb Accebilitat

## Accedir al servidor
Primer de tot lo mes important es la forma en que accedim al servidor, nosaltres recomanem instalar Tailscale que es una VPN de tipus Mesh que ens permetra accedir al servidor de forma tant localment com remotament.

Aixo funciona ja que el Servidor de Tailscale no opera com un Servidor VPN tradicional.

### Servidor VPN Tradicional
Per exemple en un servidor VPN tradicional tant clients com servidors es conecten a un servidor on passarant per alla totes les dades.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/78c07065-8bd3-48c1-a37c-ba6287af56d0)

Aquest es un molt bon metode per conectar tots els dispositius junts pero tambe te moltes desventatjes ja que per exemple si vols enviar dades sempre tindras que passar per el servidor hi aixo implica retras afegit ja que les dades tenen que anar al servidor VPN i tornar.

Un altre inconvenient es que la velocitat maxim esta limitada a la velocitat maxima de internet del Servidor VPN ja que si nosaltres tenim una velocitat de 1000Mbps pero el servidor domes en te 400Mbps estarem limitat a aquella velocitat.

Hi per acavar el inconvenient mes gran que te es que si els 2 dispositius estan a la mateixa xarxa no es conectaran amb un coneccio directa local sino que les dades tambe tindran que anar i tornar del servidor VPS

![image](https://github.com/Otorexer/SerLliure/assets/118485801/10a214b2-c2d7-4a90-ab55-d22ceda308e2)

### Tailscale
En canvi Tailscale no opera com un servidor de dades sino que domes opera com un servidor que enmagatzema i dona claus de WireGuard dels Clients i Servidors conectats aixo perque que si un client vol enviar dades a un servidor ho pot fer de forma directa sense passar per cap intermediari.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/2e2de98c-9cad-4851-b21a-55748fa01b22)

Per exemple el que hem explicat avans amb la velocitat maxima ara ja no passa ja que els 2 clients connectats podran aporfitat la velocitat maxima de les seves conexions ja que tenen una coneccio diracta.

Lo mateix passa amb el ping de les 2 maquines en un us habitual no ho notariem molt pero imaginem que volem controlar el servidor de forma remote amb RDP com que tenim les 2 maquines conectades amb un link directa el ping sempre sera el menor possible perque no tindra que anar i tornar del servidor VPN

I per acavar la part mes important de fer servir tailscale es que si tenim els 2 ordinador a la mateixa xarxa tailscale sempre buscara la conexio mes rapida possible d'aquesta forma no tenim que estar pendents de si tenim la VPS oberta o no ja que sempre tindrem la maxima connexio.





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
