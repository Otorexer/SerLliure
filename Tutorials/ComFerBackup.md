# Docker Compose
Per fer backup de els contenidors de Docker podem copiar el arxiu de **docker-compose.yml**

Aquest arxiu el podem guardar en algun lloc segur per tornar a restaurar els contenidors per si el servidor te algun problema o per fer la migracio de servidors.


# Caddy
Tambe es recomendable tenir un backup de **Caddy** per si el servidor te algun problema o si volem migrar el servidor.

Si hem seguit el tutorial aquest fitxer es trovara a
```bash
/etc/caddy/Caddyfile
```

Aquest arxiu el podem guardar en algun lloc segur per tornar a restaurar el servidor de Caddy per si el servidor te algun problema o per fer la migracio de servidors.


# Volums de Docker
Com ja saveu quant parem un docker tot el contingut que no esta guardat en un volum que li hem asignat es borrara.

Per aixo en el tutorials quant tenim que tenir data persistent li asignem un volum.
