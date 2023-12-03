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

Te que quedar d'aquesta forma hi ens tenim que assegurar que posi 4 Core i 24 GB de memoria. Tambe podem veure que avaix ens surt uns avisos, el que volem dir aquest avisos es que hem arribat al maxim de capacitat de recursos de forma gratis.![image](https://github.com/Otorexer/SerLliure/assets/118485801/1bbebcb5-f34a-4de1-82e7-ee4e8fc94c4f)

!!!Es Molt important guardar les clau privada per despres conectar-nos al servidor per SSH!!!
![image](https://github.com/Otorexer/SerLliure/assets/118485801/7fb9e539-a621-44b0-8694-ac8ff90634f7)

Un cop haguem acavat ja podrem crear la maquina

Si us surt aixo no passa res ja que el que sicnifica es que el disc per dafecte que es de 50Gb costaria 1.85€ al mes pero com que Oracle et dona per defecte 200Gb pero al moment de crear la maquina no us cobraran res ja que teniu 200Gb gratis.
![image](https://github.com/Otorexer/SerLliure/assets/118485801/5f8786cb-b7cb-4f6c-ac55-e4a79af4aee2)

Un cop tenim la maquina creada anirem a [Boot-Volumes](https://cloud.oracle.com/block-storage/boot-volumes) i alla selecionarem el unic volum que tenim, un cop dins clicarem el boto de "Edit" per editar la capacitat del volum hi el que farem sera posar 200 ja que d'aquesta forma estarem utilitzant tots els recursos que ens ofereix oracle de forma gratis.

# Accedir a la VPS
