# Instal·lació
Per instal·lar Caddy només hem d'executar aquest comandament.
```bash
wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Headscale/I-Headscale.sh && bash I-Headscale.sh && rm I-Headscale.sh
```

```bash
wget https://raw.githubusercontent.com/Otorexer/SerLliure/main/Serveis/Headscale/Headscale-Caddy.sh && bash Headscale-Caddy.sh && rm Headscale-Caddy.sh
```


## Headscale
wget --output-document=headscale.deb \
  https://github.com/juanfont/headscale/releases/download/v<HEADSCALE VERSION>/headscale_<HEADSCALE VERSION>_linux_<ARCH>.deb

  sudo dpkg --install headscale.deb

  sudo systemctl enable headscale

  nano /etc/headscale/config.yaml

  sudo systemctl start headscale

  systemctl status headscale
## Caddy
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https

curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg

curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list

sudo apt update

sudo apt install caddy

### Caddy Config
nano /etc/caddy/Caddyfile

```bash
domain.name {
    reverse_proxy localhost:8080
}
```

caddy reload
