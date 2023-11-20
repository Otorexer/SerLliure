#!/bin/bash

# Function to stop and disable FRP services
stop_and_disable_services() {
    echo "Stopping and disabling FRP services..."
    sudo systemctl stop frps frpc
    sudo systemctl disable frps frpc
    echo "FRP services stopped and disabled."
}

# Function to remove FRP binaries and configuration files
remove_frp_files() {
    echo "Removing FRP binaries and configuration files..."
    sudo rm -f /usr/local/bin/frps
    sudo rm -f /usr/local/bin/frpc
    sudo rm -rf /etc/frp
    echo "FRP binaries and configuration files removed."
}

# Function to remove FRP systemd service files
remove_service_files() {
    echo "Removing FRP systemd service files..."
    sudo rm -f /etc/systemd/system/frps.service
    sudo rm -f /etc/systemd/system/frpc.service
    sudo systemctl daemon-reload
    sudo systemctl reset-failed
    echo "FRP systemd service files removed."
}

# Function to check if all FRP files are removed
verify_removal() {
    echo "Verifying FRP uninstallation..."
    local errors=0

    # Check if binaries are removed
    if [ -f "/usr/local/bin/frps" ] || [ -f "/usr/local/bin/frpc" ]; then
        echo "Error: FRP binaries still exist."
        errors=$((errors+1))
    fi

    # Check if configuration directory is removed
    if [ -d "/etc/frp" ]; then
        echo "Error: FRP configuration directory still exists."
        errors=$((errors+1))
    fi

    # Check if service files are removed
    if [ -f "/etc/systemd/system/frps.service" ] || [ -f "/etc/systemd/system/frpc.service" ]; then
        echo "Error: FRP service files still exist."
        errors=$((errors+1))
    fi

    # Return the number of errors
    return $errors
}

# Main script execution
stop_and_disable_services
remove_frp_files
remove_service_files
verify_removal

# Check if uninstallation was successful
if [ $? -eq 0 ]; then
    echo "FRP uninstallation completed successfully."
else
    echo "FRP uninstallation completed with errors. Please check the messages above."
fi
