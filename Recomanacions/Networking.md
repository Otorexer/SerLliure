# Recomanacions

En aquest apartat, fem unes recomanacions que, per a nosaltres, serien clau per fer el servidor lo millor possible, tant en seguretat com en accessibilitat.

## Accedir al Servidor de Forma Privada 🔒

Primer de tot, el més important és la manera en què accedim al servidor. Nosaltres recomanem instal·lar Tailscale, una VPN de tipus Mesh que ens permetrà accedir al servidor tant localment com remotament sense tenir que obrir ports.

Això funciona perquè el servidor de Tailscale no opera com un servidor VPN tradicional.

### Servidor VPN Tradicional

Per exemple, en un servidor VPN tradicional, tant clients com servidors es connecten a un servidor central, on passen totes les dades.

<div align="center">
<img src="https://github.com/Otorexer/SerLliure/assets/118485801/78c07065-8bd3-48c1-a37c-ba6287af56d0" alt="Servidor VPN Convencional" style="height: 500px;">
</div>

Aquest és un bon mètode per connectar tots els dispositius, però té desavantatges, com ara el retard afegit pel trànsit de dades a través del servidor VPN i la limitació de velocitat màxima a la del servidor VPN.

Un altre inconvenient és que si dos dispositius estan a la mateixa xarxa, no es connectaran mitjançant una connexió directa local, sinó que les dades també hauran d'anar i tornar del servidor VPN.

<div align="center">
<img src="https://github.com/Otorexer/SerLliure/assets/118485801/10a214b2-c2d7-4a90-ab55-d22ceda308e2" alt="Servidor VPN Convencional" style="height: 500px;">
</div>

### Tailscale

En canvi, Tailscale opera com un servidor que emmagatzema i proporciona claus de WireGuard dels clients i servidors connectats, permetent que si un client vol enviar dades a un servidor, ho pugui fer de forma directa, sense passar per cap intermediari.

<div align="center">
<img src="https://github.com/Otorexer/SerLliure/assets/118485801/2e2de98c-9cad-4851-b21a-55748fa01b22" alt="Tailscale" style="height: 500px;">
</div>

Això significa que la velocitat màxima no es veurà limitada i que el ping entre dues màquines serà sempre el menor possible, ja que no han de passar pel servidor VPN. A més, Tailscale busca sempre la connexió més ràpida, optimitzant així la comunicació.

[Explicació completa del funcionament de Tailscale](https://tailscale.com/blog/how-tailscale-works/)

## Accedir al Servidor de Forma Pública 🌐

Per accedir al servidor de forma pública, ens referim a que qualsevol persona amb internet pugui connectar-se al nostre servidor i accedir als nostres serveis sense tenir acces a la nostre xarxa de tailscale.

Hi ha dues maneres principals d'aconseguir-ho:

### Obrir Ports al Router

Aquesta és la manera més coneguda i pot incloure l'obertura de ports com el 445 per un servidor Samba o el port 80 per allotjar una pàgina web. Aquest mètode té avantatges i desavantatges:

✅ La principal avantatge és que tothom que es vulgui connectar ho farà de manera directa, aprofitant la màxima velocitat possible del nostre pla de velocitat de la companyia de telefon.

❌ Però també hi ha un gran desavantatge: qualsevol persona tindrà accés a la nostra IP pública i podrà estimar la nostra direcció com fer atacs DDOS hi tirar-nos la conexio.

### Fer Servir Proxys amb una VPS

L'altra opció és utilitzar proxys allotjats en un servidor virtual i connectar el servidor de casa mitjançant Tailscale. Aquesta opció també té avantatges i desavantatges:

✅ Una avantatge és que ens permetrà tenir més seguretat, ja que ningú sabrà la nostra IP pública.

❌ Però, com que tot el tràfic haurà d'anar primer al servidor virtual i després al de casa, tindrem un augment de ping i una limitació en la velocitat.

Personalment, recomanem tenir una VPS, ja que, a més de ser el nostre punt d'accés a internet, ens permetrà mantenir serveis que sempre estaran disponibles, inclús si el servidor de casa deixa de funcionar. Un exemple seria un servidor DNS o alguna cosa important que volem tenir accés en tot moment.

## DNS

Una altra cosa molt important és tenir un sistema de DNS per no haver de buscar l'adreça IP cada vegada que ens volem connectar a algun servidor.

El que recomanem és tenir un DNS privat i un DNS de domini, com per exemple un .com o .es. Això ho farem perquè no volem que tot internet vegi que tenim un domini redirigit a adreces IP de Tailscale, però ho podríem fer tot amb un domini convencional.

### DNS Privat 🔒
#### Tailscale
Si dicidim fer servir Tailscale i no hostejar el nostre propi servidor de Headscale ho farem amb Pi-Hole ja que ens permetre crear DNS de forma personalitzada com podria ser un .local, apart que Pi-Hola tambe bloqueja anuncis i pagines no desitjades.
>[!WARNING]
>Aquesta opcio no acava de funcionar del tot be sobretot en dispositius movils.

#### [Pi-Hole](https://github.com/Otorexer/SerLliure/tree/main/Pi-Hole)
#### Headscale
Si crem el nostre propi servidor de Headscale que es lo recomenat ho farem editant la configuracio de Headscale ja que d'aquesta forma tindrem la millor compatibilitat possible i sabrem que mai fallara.
### DNS Públic 🌐

El DNS públic el farem servir perquè la gent que es vulgui connectar als nostres servidors no tingui que estar posant l'IP cada vegada, una cosa que avui en dia és gairebé obligatòria. Hi ha moltes pàgines web per comprar dominis, així com pàgines per obtenir el teu domini de manera gratuïta.
