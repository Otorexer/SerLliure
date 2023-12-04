# Instalacio
Per instalar AdGuardHome amb docker domes tenim que executar aquest comande.

Hem de tenim compet que com que AdGuardHome fa servier el port 53/tpc i 53/udp tindrem que fer un canvis en la configuracio de Resolucio de DNS del servidor pero no hi ha problema ja que el script ho fa de forma automatica.
```bash
wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/AdGuardHome/Install.sh && bash Install.sh && rm Install.sh
```
# Primers passos
El primer inici de sessio el tenim que fer des de la direccio IP de Tailscale amb el port 3000.

Hi ens sortira una pagina com Aquesta i clicarem a siguiente.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/128a17f5-50fd-4225-8f27-607794ad7f39)

Despres tenim que canviar el ports al port 10001.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/8b52d622-0c3f-4e69-afa0-43deb840a495)

I per acavar posema el nom de Usuari i Contrasenya i ja tindrem la instalacio feta de AdGuardHome.

# Configuracio Tailscale
Si volem que per defecte tots els clients connectats a la xarxa de tailscale fagin us d'aquest servidor DNS tenim que configurar-ho.

Primer de tot tenim que accedir a la [Configuracio de DNS](https://login.tailscale.com/admin/dns) de Tailscale hi alla tenim que canviar alguns parametre.

Despres tenim que activar la funcio de Tailscale per ometre la DNS del client hi sempre fer servir la de AdGuard aixo es fa amb el petit boto que diu "Override localDNS"

Un cop fet aixo afegirem un servidor DNS clicant a Add Nameserver -> Custom i alla posarem la Direccio IP del Servidor on hem instalat AdGuardHome.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/059d72d0-2edf-40cf-928d-a5821b78c458)
Un cop afegit al servidor afegirem tambe el servidor de Google i altre per si el nostre servidor falla que els clients tinguin servidor de respaldo.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/921772fa-fb8a-4fff-b1da-94dc24f7585a)

Ens tindria que quedar algo aixis.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/24df2452-e5bb-4a38-971c-e0d948e8c8a9)
