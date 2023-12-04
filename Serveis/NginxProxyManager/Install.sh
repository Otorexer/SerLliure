#!/bin/bash

# Pull and run the Nginx Proxy Manager Docker container
docker run -d --name nginxproxy \
    -p 80:80 \
    -p 81:81 \
    -p 443:443 \
    -v /etc/nginx/data:/data \
    -v /etc/nginx/letsencrypt:/etc/letsencrypt \
    jc21/nginx-proxy-manager:latest

# Check if the container is running
echo "Checking if Nginx Proxy Manager is running..."
docker ps | grep nginxproxy

# Script ends
echo "Nginx Proxy Manager installation script has completed."
