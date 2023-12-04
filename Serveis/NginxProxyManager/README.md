# Instalacio
Aquesta instalacio de NginxProxyManager ens servira per accedir als nostre serveis de forma tant local com remota i tambe exposar ports de la nostre xarxa de forma facil.

Primer de tot, utilitza aquesta comanda per instal·lar NginxProxyManager amb docker.

```bash
wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/NginxProxyManager/Install.sh && bash Install.sh && rm Install.sh
```
Un cop el tinguem instalat podrem accedir a la configuracio amb la IP de tailscale hi el port 81.

Per començar tindrem aquesta pagina on tindrem que posar les credencials per defecte.

Mail: admin@example.com

Passwd: changeme

![image](https://github.com/Otorexer/SerLliure/assets/118485801/5a8dea1e-6781-4baf-8865-1d7fd31c4bd1)

Un cop haguem entrat ens demanara que canviem el nom de Usuari com el Mail i despres que canviem la Contrasenya i despres ja tindrem acces a NginxProxyManager.
# Creacio Proxy
Per crear una nova proxy per algun servei es molt facil

Primer anirem al menu principal hi anirem a Proxy Host

![image](https://github.com/Otorexer/SerLliure/assets/118485801/353e4388-f83d-4dce-b906-f9c92741d3bb)
