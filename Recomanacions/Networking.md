# Recomanacions
En aquest apartat fem unes recomenacions que per nosaltres serien per fer el servidor perfecte tant amb seguretat com amb Accebilitat

## Accedir al servidor de forma privada
Primer de tot lo mes important es la forma en que accedim al servidor, nosaltres recomanem instalar Tailscale que es una VPN de tipus Mesh que ens permetra accedir al servidor de forma tant localment com remotament.

Aixo funciona ja que el Servidor de Tailscale no opera com un Servidor VPN tradicional.

### Servidor VPN Tradicional
Per exemple en un servidor VPN tradicional tant clients com servidors es conecten a un servidor on passarant per alla totes les dades.

<div align="center">
<img src="https://github.com/Otorexer/SerLliure/assets/118485801/78c07065-8bd3-48c1-a37c-ba6287af56d0" alt="Servidor VPN Convencinal" style="height: 500px;">
</div>

Aquest es un molt bon metode per conectar tots els dispositius junts pero tambe te moltes desventatjes ja que per exemple si vols enviar dades sempre tindras que passar per el servidor hi aixo implica retras afegit ja que les dades tenen que anar al servidor VPN i tornar.

Un altre inconvenient es que la velocitat maxim esta limitada a la velocitat maxima de internet del Servidor VPN ja que si nosaltres tenim una velocitat de 1000Mbps pero el servidor domes en te 400Mbps estarem limitat a aquella velocitat.

Hi per acavar el inconvenient mes gran que te es que si els 2 dispositius estan a la mateixa xarxa no es conectaran amb un coneccio directa local sino que les dades tambe tindran que anar i tornar del servidor VPS

<div align="center">
<img src="https://github.com/Otorexer/SerLliure/assets/118485801/10a214b2-c2d7-4a90-ab55-d22ceda308e2" alt="Servidor VPN Convencinal" style="height: 500px;">
</div>

### Tailscale
En canvi Tailscale no opera com un servidor de dades sino que domes opera com un servidor que enmagatzema i dona claus de WireGuard dels Clients i Servidors conectats aixo perque que si un client vol enviar dades a un servidor ho pot fer de forma directa sense passar per cap intermediari.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/2e2de98c-9cad-4851-b21a-55748fa01b22)

Per exemple el que hem explicat avans amb la velocitat maxima ara ja no passa ja que els 2 clients connectats podran aporfitat la velocitat maxima de les seves conexions ja que tenen una coneccio diracta.

Lo mateix passa amb el ping de les 2 maquines en un us habitual no ho notariem molt pero imaginem que volem controlar el servidor de forma remote amb RDP com que tenim les 2 maquines conectades amb un link directa el ping sempre sera el menor possible perque no tindra que anar i tornar del servidor VPN

I per acavar la part mes important de fer servir tailscale es que si tenim els 2 ordinador a la mateixa xarxa tailscale sempre buscara la conexio mes rapida possible d'aquesta forma no tenim que estar pendents de si tenim la VPS oberta o no ja que sempre tindrem la maxima connexio.

[Explicacio completa del funcionament](https://tailscale.com/blog/how-tailscale-works/)

## Accedir al servidor de forma publica
Per accedir al servidor de forma publica ens referim a que qualsevol persona amb internet es pugui connectar al nostre servidor hi accedir als nostres servidors.

Per aconseguir aixo ho podem fer de 2 formes.

### Obrir ports al Router
La primera forma es la mes coneguda hi es obrir ports al nostre router ja pot ser el port 445 per un servidor Samba com un port 80 per allotjar una pagina Web.

Aquest metode te aventatjes i desaventatjes.

La principal aventatje de obrir ports al router es que tothom que es vulgui conectar a algunn servei ho fara de forma directa hi amb la maxima velocitat possible que ofereixi el nostre plan de velocitat.

Pero tambe hi ha un gran desaventatje hi es que qualsevol persona tindra acces a la nostre IP publica hi podran estimar la nostre direccio.

### Fer servir proxys amb una VPS
L'altre opcio es fer servir proxys hostejades amb un servidor virtual i conectar el servidor amb el servidor de casa mitjançant Tailscale.

Aquesta opcio tambe te aventatjes i desaventatjes.

Una aventatjes es que ens permetra tenir mes seguretat ja que ningu sabra la nostre IP Publica de casa nostre.

Per en canvi com que tot el trafic tindra que anar primer al servidor virtual i despres al servidor de casa tindrem un augment de ping com una limitacio en la velocitat.

Nosaltres personalment recomanem tenir una VPS ja que apart de ser la nostre sortida del servidor al internet tambe ens permetra tenir serveis que semple estaran disponible inclus que el servidor de casa nostre deixi de funcionar. Un exemple seria un servidor DNS o alguna cosa important que volem tenir acces en tot moment.






#### DNS
Per facilitar l'accés al servidor, utilitzarem servidors DNS. Recomanem tenir dos DNS: un públic i un privat.

##### DNS Públic
El DNS públic es pot configurar comprant un domini propi o utilitzant subdominis gratuïts que ofereixen algunes pàgines.

##### DNS Privat
Per al DNS privat, es pot utilitzar el de Tailscale, encara que ofereix poc control i no es molt facil de enrecordar. Recomanem crear un propi servidor DNS amb AdGuard i Bind per aquesta forma tenir una protecio i Dominis Privat bonics i facils de controlar.
