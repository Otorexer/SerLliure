#!/bin/bash

# FRP Client Version and Download URL
FRP_VERSION="0.52.3"
FRP_URL="https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz"
CONFIG_DIR="/etc/frp" # Directory to store frpc.ini

# Function to download and setup FRP Client
download_and_setup_frpc() {
    echo "Downloading FRP Client version ${FRP_VERSION}..."
    wget ${FRP_URL} -O frpc.tar.gz || curl -L ${FRP_URL} -o frpc.tar.gz

    echo "Extracting FRP Client..."
    tar zxvf frpc.tar.gz
    cd frp_${FRP_VERSION}_linux_amd64

    echo "Copying frpc binary to /usr/local/bin"
    sudo cp frpc /usr/local/bin
    cd ..

    echo "Cleaning up..."
    rm -rf frp_${FRP_VERSION}_linux_amd64 frpc.tar.gz

    echo "FRP Client installed successfully."
}

# Function to prompt for client configuration
ask_for_client_config() {
    read -p "Enter your FRP client user name [your_name]: " frpcUser
    frpcUser=${frpcUser:-your_name}

    read -p "Enter the FRP server address [0.0.0.0]: " serverAddr
    serverAddr=${serverAddr:-0.0.0.0}

    read -p "Enter the FRP server port [7000]: " serverPort
    serverPort=${serverPort:-7000}

    read -p "Enter the auth token [12345678]: " authToken
    authToken=${authToken:-12345678}

    # Additional prompts for web server configuration
    read -p "Enter the Web Server address [127.0.0.1]: " webServerAddr
    webServerAddr=${webServerAddr:-127.0.0.1}

    read -p "Enter the Web Server port [7400]: " webServerPort
    webServerPort=${webServerPort:-7400}

    read -p "Enter the Web Server user [admin]: " webServerUser
    webServerUser=${webServerUser:-admin}

    read -p "Enter the Web Server password [admin]: " webServerPassword
    webServerPassword=${webServerPassword:-admin}
}

# Function to write the FRP client configuration and move it to the specified directory
write_and_move_client_config() {
    echo "Writing FRP client configuration..."
    cat <<EOF >frpc.ini
user = "$frpcUser"
serverAddr = "$serverAddr"
serverPort = $serverPort
auth.token = "$authToken"
webServer.addr = "$webServerAddr"
webServer.port = $webServerPort
webServer.user = "$webServerUser"
webServer.password = "$webServerPassword"
EOF

    echo "Moving configuration file to ${CONFIG_DIR}"
    sudo mkdir -p ${CONFIG_DIR}
    sudo mv frpc.ini ${CONFIG_DIR}/frpc.ini
    echo "Configuration file moved successfully."
}

# Function to create and enable the frpc service
create_and_enable_service() {
    echo "Creating frpc service..."

    # Create the systemd service file
    sudo bash -c 'cat <<EOF >/etc/systemd/system/frpc.service
[Unit]
Description=Frp Client Service
After=network.target

[Service]
Type=simple
User=nobody
Restart=on-failure
RestartSec=5s
ExecStart=/usr/local/bin/frpc -c /etc/frp/frpc.ini
ExecReload=/usr/local/bin/frpc reload -c /etc/frp/frpc.ini
LimitNOFILE=1048576

[Install]
WantedBy=multi-user.target
EOF'

    # Reload systemd to read the new service file
    sudo systemctl daemon-reload

    # Enable and start the service
    sudo systemctl enable frpc
    sudo systemctl start frpc

    echo "frpc service created and started."
}

# Main script execution
download_and_setup_frpc
echo "Setting up the FRP Client..."
ask_for_client_config
write_and_move_client_config
create_and_enable_service

echo "FRP Client setup complete. Configuration file is located at ${CONFIG_DIR}/frpc.ini"
