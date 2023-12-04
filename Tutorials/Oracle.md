# ⚠️Tot el que feu esta sota la vostre responsabilitat⚠️
Per no cometre cap error es important verificar que Oracle encara ofereix aquest servei de forma gratuita com tambe tot els recursos gratuits que ofereixen en aquest moment.
# Creacio compte
Primer de tot entrarem a https://www.oracle.com/cloud/free/ per crear la nostre compte i despres enplenarem les dades que ens demanen i oracle ens enviara un mail per crear les nostres credencials per registrar-nos.

# Creacio de la VPS
Per crear una nova maquin virtual tenim que anar a l'apartat de Compute -> Instances i despres a "Create Instance".

[Link](https://cloud.oracle.com/compute/instances)

Un cop a dins assignarem un nom per la Maquina.

Ara canviarem la imatje de la Maquina. !!!Es molt important posar Ubuntu Server aarch64!!! ja que el servei gratis que et dona oracle es domes amb procesadors ARM.

Despres tenim que editar la forma de la maquin hi posarem 4 Nuclis i 24GB de RAM.

Te que quedar d'aquesta forma hi ens tenim que assegurar que posi 4 Core i 24 GB de memoria. Tambe podem veure que avaix ens surt uns avisos, el que volem dir aquest avisos es que hem arribat al maxim de capacitat de recursos de forma gratis.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/1bbebcb5-f34a-4de1-82e7-ee4e8fc94c4f)

!!!Es Molt important guardar les clau privada per despres conectar-nos al servidor per SSH!!!

![image](https://github.com/Otorexer/SerLliure/assets/118485801/7fb9e539-a621-44b0-8694-ac8ff90634f7)

Un cop haguem acavat ja podrem crear la maquina

Si us surt aixo no passa res ja que el que sicnifica es que el disc per dafecte que es de 50Gb costaria 1.85€ al mes pero com que Oracle et dona per defecte 200Gb pero al moment de crear la maquina no us cobraran res ja que teniu 200Gb gratis.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/5f8786cb-b7cb-4f6c-ac55-e4a79af4aee2)

Un cop tenim la maquina creada anirem a [Boot-Volumes](https://cloud.oracle.com/block-storage/boot-volumes) i alla selecionarem el unic volum que tenim, un cop dins clicarem el boto de "Edit" per editar la capacitat del volum hi el que farem sera posar 200 ja que d'aquesta forma estarem utilitzant tots els recursos que ens ofereix oracle de forma gratis.

# Accedir a la VPS
Per accedir a la nostre VPS amb SSH primer de tot tenim que transformar la Clau privada am PuTTYgen.

Primer de tot anirem a Conversions -> Import Key un cop alla selecionarem el arxiu que hem descargat anteriormanet de Oracle.

I despres clicarem a Save Private Kay per generar la clau amb format ppk perque PuTTY ho pugui entendre.

Despres obrirem PuTTY i a lapartat de Host Name posarem el username que ens surt a la VPS que hem creat

![image](https://github.com/Otorexer/SerLliure/assets/118485801/d6362ece-676f-4ad4-9163-1de72afdc194)

Hi despres posarem @ i la IP publica de la Maquina que tambe la podrem trobar a la VPS.

Ens tindria que quedar algo aixis.

![image](https://github.com/Otorexer/SerLliure/assets/118485801/b7039ccb-ef6d-45eb-bd53-d1ecd9426bd3)

Un cop aixo fet tenim que anar al Menu de la Esquerra i buscar Credential que es troba a. Connection -> SSH -> Auth -> Credentials, hi alla on posa Primate key file clicarem a buscar i selecionarem el arxiu ppk un cop aixo fet ja podrem clicar el boto de connectar i tindrem acces a la VPS.

# Primers passos
### Canviar contrasenya
Els primers passos que recomanem fer la primera vegada que tinguem acces es fer aquest comando per canviar la contrasenya de Root.
```bash
sudo passwd
```
### Actualitzar Sistema
Fer un Update del Sistema
```bash
sudo apt update && sudo apt upgrade -y
```
### Firewall
I desactivar el Firewall de Ubuntu server per Defecte ja que el Firewall el controlarem des de Oracle ja que sino la xarxa de Tailscale no tindra Acces.
```bash
sudo iptables -F && sudo iptables -P INPUT ACCEPT && sudo iptables -P FORWARD ACCEPT && sudo iptables -P OUTPUT ACCEPT && sudo netfilter-persistent save
```
### Tailscale
Un cop tinguem tot aixo fet Instalarem Tailscale amb la guia que tenim en aquest Repositori.
Tailscale el farem servir per conectar-nos al servidor sense tenir que obrir cap port al firewall aixis domes la nostre xarxa de Tailscale podra accedir a coses especifiques aquesta es una altre mesura per prevenir atacs.

[Guia](https://github.com/Otorexer/SerLliure/tree/main/Serveis/Tailscale)
### WebMin
I despres instalar WebMin
```bash
curl -o setup-repos.sh https://raw.githubusercontent.com/webmin/webmin/master/setup-repos.sh && sh setup-repos.sh
```
```bash
apt-get install webmin --install-recommends -y
```
Usuari: root
Contrasenya: (La que hem posat avans)
Entrarem al WebMin amb la IP de la maquina que ens dona Tailscale per aixis no tenir que obrir cap port i no comprometre la nostre seguretat.
# Firewall Oracle
Si volem editar la configuracio del Firewall de Oracle tenim que anara a la nostre VPS i clicar sobre la xarxa que tenim assignada a la VPS

![image](https://github.com/Otorexer/SerLliure/assets/118485801/c930dd7f-b22c-43c2-a254-393c9e187bd5)

Despres anar al menu de la Esquerra a Security List

![image](https://github.com/Otorexer/SerLliure/assets/118485801/d041ff1d-d4eb-4b71-a3a9-ce1c0bea3617)

I clicar el Unic que tenim creat que per defecte sera el Default Security List.

Un cop alla podem agregar o eliminiar regles de firewal per la adreça IP publica.

Es important no eliminiar ni crear res sense saber el que fas. Sempre tenim que seguir guis confiables.
