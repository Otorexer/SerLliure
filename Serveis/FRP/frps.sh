#!/bin/bash

# FRP Version and Download URL
FRP_VERSION="0.52.3"
FRP_URL="https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz"
CONFIG_DIR="/etc/frp" # Directory to store frps.ini

# Function to download and setup FRP
download_and_setup_frp() {
    echo "Downloading FRP version ${FRP_VERSION}..."
    wget ${FRP_URL} -O frp.tar.gz || curl -L ${FRP_URL} -o frp.tar.gz

    echo "Extracting FRP..."
    tar zxvf frp.tar.gz
    cd frp_${FRP_VERSION}_linux_amd64

    echo "Copying frps binary to /usr/local/bin"
    sudo cp frps /usr/local/bin
    cd ..

    echo "Cleaning up..."
    rm -rf frp_${FRP_VERSION}_linux_amd64 frp.tar.gz

    echo "FRP installed successfully."
}

# Function to prompt for server configuration
ask_for_config() {
    read -p "Enter the subdomain host [example.com]: " subDomainHost
    subDomainHost=${subDomainHost:-example.com}

    read -p "Enter the bind address [0.0.0.0]: " bindAddr
    bindAddr=${bindAddr:-0.0.0.0}

    read -p "Enter the bind port [7000]: " bindPort
    bindPort=${bindPort:-7000}

    read -p "Enter the KCP bind port [7000]: " kcpBindPort
    kcpBindPort=${kcpBindPort:-7000}

    read -p "Enter the vhost HTTP port [80]: " vhostHTTPPort
    vhostHTTPPort=${vhostHTTPPort:-80}

    read -p "Enter the vhost HTTPS port [443]: " vhostHTTPSPort
    vhostHTTPSPort=${vhostHTTPSPort:-443}

    read -p "Enter the web server address [127.0.0.1]: " webServerAddr
    webServerAddr=${webServerAddr:-127.0.0.1}

    read -p "Enter the web server port [7500]: " webServerPort
    webServerPort=${webServerPort:-7500}

    read -p "Enter the web server user [admin]: " webServerUser
    webServerUser=${webServerUser:-admin}

    read -sp "Enter the web server password [admin]: " webServerPassword
    webServerPassword=${webServerPassword:-admin}
    echo

    read -p "Enter the auth token [12345678]: " authToken
    authToken=${authToken:-12345678}
}

# Function to write the FRP server configuration and move it to the specified directory
write_and_move_config() {
    echo "Writing FRP server configuration..."
    cat <<EOF >frps.ini
# FRP server configuration
subDomainHost = "$subDomainHost"
bindAddr = "$bindAddr"
bindPort = $bindPort
kcpBindPort = $kcpBindPort
vhostHTTPPort = $vhostHTTPPort
vhostHTTPSPort = $vhostHTTPSPort
webServer.addr = "$webServerAddr"
webServer.port = $webServerPort
webServer.user = "$webServerUser"
webServer.password = "$webServerPassword"
auth.token = "$authToken"
EOF

    echo "Moving configuration file to ${CONFIG_DIR}"
    sudo mkdir -p ${CONFIG_DIR}
    sudo mv frps.ini ${CONFIG_DIR}/frps.ini
    echo "Configuration file moved successfully."
}

# Function to create and enable the frps service
create_and_enable_service() {
    echo "Creating frps service..."

    # Create the systemd service file
    sudo bash -c 'cat <<EOF >/etc/systemd/system/frps.service
[Unit]
Description=FRP Server (frps)
After=network.target

[Service]
Type=simple
User=root
ExecStart=/usr/local/bin/frps -c /etc/frp/frps.ini
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF'

    # Reload systemd to read the new service file
    sudo systemctl daemon-reload

    # Enable and start the service
    sudo systemctl enable frps
    sudo systemctl start frps

    echo "frps service created and started."
}

# Function to check for updates
check_for_updates() {
    echo "Checking for updates..."
    # Implement update check logic here
    # You can use git or wget to fetch the latest version and compare with FRP_VERSION
    echo "Update feature is not implemented yet."
}

# Function to reconfigure FRP
reconfigure_frp() {
    echo "Reconfiguring FRP..."
    ask_for_config
    write_and_move_config
    sudo systemctl restart frps
    echo "FRP reconfigured successfully."
}

# Main script execution
if [ -f "${CONFIG_DIR}/frps.ini" ]; then
    echo "FRP is already installed. Do you want to update or reconfigure it? (update/reconfigure/no)"
    read action
    case $action in
        update)
            check_for_updates
            ;;
        reconfigure)
            reconfigure_frp
            ;;
        *)
            echo "No action selected."
            ;;
    esac
else
    download_and_setup_frp
    echo "Setting up the FRP server..."
    ask_for_config
    write_and_move_config
    create_and_enable_service
    echo "FRP server setup complete. Configuration file is located at ${CONFIG_DIR}/frps.ini"
fi
