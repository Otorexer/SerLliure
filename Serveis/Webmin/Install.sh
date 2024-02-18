#!/bin/bash
rm setup-repos.sh
curl -o setup-repos.sh https://raw.githubusercontent.com/webmin/webmin/master/setup-repos.sh
bash setup-repos.sh
rm setup-repos.sh
apt-get install webmin --install-recommends -y
