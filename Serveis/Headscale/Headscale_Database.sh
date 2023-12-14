#!/bin/bash

# Ask the user for the Postgres password
read -p "Enter the Postgres password: " POSTGRES_PASSWORD

# Escape special characters in the password
POSTGRES_PASSWORD_ESCAPED=$(printf '%s\n' "$POSTGRES_PASSWORD" | sed 's:[\/&]:\\&:g;$!s/$/\\/')

# Create the Docker Compose file
cat > docker-compose.yml << EOF
version: '3.1'

services:
  db:
    image: postgres
    restart: always
    environment:
      POSTGRES_PASSWORD: $POSTGRES_PASSWORD
      POSTGRES_DB: headscale
      POSTGRES_USER: headscale
    ports:
      - "8081:5432"
    volumes:
      - /etc/headscale_database:/var/lib/postgresql/data
EOF

echo "Docker Compose file created."

docker compose up -d
# Update the password in /etc/headscale/config.yaml
sed -i "s/^db_pass: .*/db_pass: $POSTGRES_PASSWORD_ESCAPED/" /etc/headscale/config.yaml

echo "Updated password in /etc/headscale/config.yaml."

# Restart the headscale service
sudo systemctl restart headscale

echo "Headscale service restarted."
