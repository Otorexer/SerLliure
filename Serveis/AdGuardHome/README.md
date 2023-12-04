# Instal·lació
Per instal·lar AdGuardHome amb Docker, només hem d'executar aquest comandament.

Cal tenir en compte que, com AdGuardHome utilitza els ports 53/tcp i 53/udp, haurem de fer alguns canvis en la configuració de Resolució de DNS del servidor, però no hi ha problema, ja que l'script ho fa de manera automàtica.
```bash
wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/AdGuardHome/Install.sh && bash Install.sh && rm Install.sh
```
# Primers Passos
El primer inici de sessió l'hem de fer des de l'adreça IP de Tailscale amb el port 3000.

Ens apareixerà una pàgina com aquesta i clicarem a 'següent'.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/128a17f5-50fd-4225-8f27-607794ad7f39)

Després, hem de canviar els ports al port 10001.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/8b52d622-0c3f-4e69-afa0-43deb840a495)

I per acabar, posem el nom d'usuari i contrasenya i ja tindrem la instal·lació feta d'AdGuardHome.

# Configuració Tailscale (No Sol Funcionar Molt Be)
Si volem que per defecte tots els clients connectats a la xarxa de Tailscale facin ús d'aquest servidor DNS, hem de configurar-ho.

Primer de tot, hem d'accedir a la [Configuració de DNS](https://login.tailscale.com/admin/dns) de Tailscale i allà hem de canviar alguns paràmetres.

Després, hem d'activar la funció de Tailscale per ometre la DNS del client i sempre fer servir la d'AdGuard, això es fa amb el petit botó que diu "Override local DNS".

Un cop fet això, afegirem un servidor DNS clicant a 'Add Nameserver' -> 'Custom' i allà posarem l'adreça IP del servidor on hem instal·lat AdGuardHome.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/059d72d0-2edf-40cf-928d-a5821b78c458)
Un cop afegit al servidor, afegirem també el servidor de Google i un altre per si el nostre servidor falla, així els clients tindran un servidor de reserva.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/921772fa-fb8a-4fff-b1da-94dc24f7585a)

Ens hauria de quedar alguna cosa així. El servidor propi, que és el que té l'adreça IP, sempre ha d'estar a dalt, ja que serà el primer que utilitzaran els clients per defecte.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/24df2452-e5bb-4a38-971c-e0d948e8c8a9)

Hi ja tindrem AdGuardHome configurat de DNS per defecte amb el Clients que fagin servir Tailscale.
