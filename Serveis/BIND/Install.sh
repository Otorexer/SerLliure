#!/bin/bash

# Update package list
sudo apt-get update

# Install bind9
sudo apt-get install -y bind9

# Backup the original configuration file
sudo cp /etc/bind/named.conf.options /etc/bind/named.conf.options.backup

# Write new configuration to named.conf.options
sudo bash -c 'cat > /etc/bind/named.conf.options' << EOF
options {
	directory "/var/cache/bind";

	// If there is a firewall between you and nameservers you want
	// to talk to, you may need to fix the firewall to allow multiple
	// ports to talk.  See http://www.kb.cert.org/vuls/id/800113

	// If your ISP provided one or more IP addresses for stable 
	// nameservers, you probably want to use them as forwarders.  
	// Uncomment the following block, and insert the addresses replacing 
	// the all-0's placeholder.

	// forwarders {
	// 	0.0.0.0;
	// };

	//========================================================================
	// If BIND logs error messages about the root key being expired,
	// you will need to update your keys.  See https://www.isc.org/bind-keys
	//========================================================================
	dnssec-validation auto;
	listen-on port 5353 { any; };
	query-source port 5353;
	listen-on-v6 { any; };
};
EOF

# Restart bind9 to apply changes
sudo systemctl restart bind9

echo "bind9 installed and configured as per provided configuration"
