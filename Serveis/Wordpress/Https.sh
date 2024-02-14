# Creates the direcotry to save ssl
mkdir /etc/wordpress-https

# Removes any existing ssl
sudo rm /etc/wordpress-https/key.pem
sudo rm /etc/wordpress-https/cert.pem

# Generates new key.pem
sudo openssl genpkey -algorithm RSA -out /etc/wordpress-https/key.pem

#Generates new cert.pem based on the previusly generated key.pem
sudo openssl req -new -x509 -key /etc/wordpress-https/key.pem -out /etc/wordpress-https/cert.pem -days 365

# Gives permisison to caddy for accesing the files
sudo chown caddy:caddy /etc/wordpress-https/key.pem
sudo chown caddy:caddy /etc/wordpress-https/cert.pem
sudo chmod 600 /etc/wordpress-https/key.pem
sudo chmod 644 /etc/wordpress-https/cert.pem
