# Instal·lació

Aquesta instal·lació de BIND9 està pensada per ser utilitzada amb AdGuardHome, ja que fa servir el port 5353.

Primer de tot, utilitza aquesta comanda per instal·lar el servidor de BIND9 i actualitzar la configuració automàticament perquè funcioni en el port 5353:

```bash
wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/BIND/Install.sh && bash install.sh && rm install.sh
```

Un cop instal·lat BIND, recomanem fer servir WebMin, ja que facilita molt la configuració. BIND es troba al apartat `Servers -> BIND DNS Server`. Si no el trobes, has d'utilitzar el botó `Refresh Modules` de WebMin per detectar els nous mòduls.

Primer, crearem una Zona Master i hi introduirem els següents paràmetres:

Recomanem posar el vostre domini amb un `.local`, ja que així, si feu servir `.local`, sabreu que esteu accedint de forma privada a la IP. Però realment podeu posar el domini que vulgueu.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/6c28da3c-2e85-47ca-8646-cd2428c381cc)

Un cop tinguem la Zona Master creada, veurem que podem fer diverses accions. El principal que farem servir són els menús `Address`, que serveix per crear un registre apuntant a alguna IP, i `Name Alias (CNAME)`, que ens servirà per si volem crear algun subdomini apuntant a un registre principal.

# Configuració AdGuardHome

Ara hem de configurar AdGuardHome perquè respongui correctament amb el DNS que hem creat.

Primer, accedirem a la web de configuració d'AdGuard i anirem a `Settings -> DNS Settings`.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/6d454755-3cd1-4e55-b757-65f19e909bf6)

Allà, veurem que tenim un servidor per defecte. Aquest no l'hem de tocar, ja que és el que fa servir AdGuardHome per respondre a les peticions que són servidors DNS públics com el de Google (8.8.8.8).

El que hem de fer és copiar la direcció IP del nostre servidor on hem configurat el BIND i posar el port al final amb dos punts:

![image](https://github.com/Otorexer/SerLliure/assets/118485801/97b88919-fabc-4826-af2e-2fdfbd45f3b4)

I, per acabar, hem de fer que AdGuardHome busqui a tots els servidors DNS cada vegada que fem una petició. Si no, AdGuardHome per defecte fa servir el servidor que porta per defecte. Canvia de `Load-Balancing` a `Parallel Request`.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/59129f4a-0f33-4fe8-a608-4d9440d12768)

I aplica la configuració.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/6f589386-c621-457a-b148-7b14e0d33713)
