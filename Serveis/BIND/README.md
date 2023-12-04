# Instalacio
Aquesta instalacio de BIND9 esta pensada per far-se servir amb AdGuardHome ja que fa servir el port 5353.

Primer de tot farem servir aquest comande per instalar el Servidor de BIND9 i actualitzar la configuracio automaticament perque funcioni en el port 5353.
```bash
wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/BIND/Install.sh && bash install.sh && rm install.sh
```
Un cop el BIND instalat us recomanem fer servir WebMin ja que ens facilita molt la configuracio BIND es troba al apartat de Servers -> BIND DNS Server si no el trobeu teniu que fer servir el boto de Refrash Modules de WebMin perque detecti els nous moduls.

Primer de tot crearem una Zona Master i posarem els seguents parametres.

Nosaltres recomanem posar el vostre domini que tingueu amb un .local ja que d'aquesta forma si feu servir .local sabreu que esteu accedint de forma privada a la IP. Pero realment podeu posar el domini que volgueu.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/6c28da3c-2e85-47ca-8646-cd2428c381cc)

Un cop tinguem la Zona Master creada veurem que podem fer varies coses lo principal que farem servir seran els menus de Address que serveix per crear un registre apuntant a alguna IP i Name Alias (CNAME) que ens servira per si volem crear algun subdomini apuntant a una Registre principal.

# Configuracio AdGuardHome
Ara tenim que configurar AdGuradHome perque respongui de forma correcta amb el DNS que hem creat.

Primer de tot accedirem a la Web de configuracio de adguard hi anirem a l'apartat de Settings -> DNS Settings

![image](https://github.com/Otorexer/SerLliure/assets/118485801/6d454755-3cd1-4e55-b757-65f19e909bf6)

Un cop alla posarem veurem quye tenim un servidor per defecte aquest no el tenim que tocar ja que es el que fa Servir AdguardHome per respondre a les peticions que fem que son servidors DNS public comk podria ser el de Google (8.8.8.8).

El que tenim que fer es copiar la direcio IP del nostre servidor on hem configurat el BIND i posar el port al final amb doble punt d'aquesta forma.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/97b88919-fabc-4826-af2e-2fdfbd45f3b4)

Hi per acavar tenim que fer que AdGuardHome busqui a tots els servidors DNS cada vegada fem una peticio ja que sino AdGuardHome per defecte fa servir el servidor que porta per defecte, que canviar de Load-Balancing a Parallel Request.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/dfc2c019-bdcf-4bd5-9a15-de4ff47be64a)

Hi aplicar la configuracio.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/6f589386-c621-457a-b148-7b14e0d33713)
