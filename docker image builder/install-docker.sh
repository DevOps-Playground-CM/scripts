#!/bin/bash

# Check if script is run as root/sudo
if [ "$EUID" -ne 0 ]; then 
    echo "This script must be run as root. Requesting sudo privileges..."
    exec sudo "$0" "$@"
    exit
fi

# Store the actual user who ran the script
ACTUAL_USER=${SUDO_USER:-$USER}

echo "Detecting Ubuntu version..."
UBUNTU_VERSION=$(lsb_release -rs)

echo "Your Ubuntu version: $UBUNTU_VERSION"

echo "Updating package index..."
apt update -y

echo "Installing required dependencies..."
apt install -y apt-transport-https ca-certificates curl software-properties-common

if [[ "$UBUNTU_VERSION" == "14.04" ]]; then
    echo "Installing Docker using 'docker.io' for Ubuntu 14.04..."
    apt install -y docker.io
    echo "Starting Docker service..."
    service docker start
    echo "Enabling Docker service on boot..."
    update-rc.d docker defaults

elif [[ "$UBUNTU_VERSION" == "16.04" ]]; then
    echo "Installing Docker CE (legacy method for Ubuntu 16.04)..."
    apt install -y docker.io
    echo "Starting Docker service..."
    systemctl start docker
    systemctl enable docker

else
    echo "Adding Docker's official GPG key..."
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    echo "Adding Docker repository..."
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

    echo "Updating package index again..."
    apt update -y

    echo "Installing Docker CE..."
    apt install -y docker-ce docker-ce-cli containerd.io

    echo "Starting and enabling Docker service..."
    systemctl start docker
    systemctl enable docker
fi

echo "Adding the user $ACTUAL_USER to the 'docker' group..."
usermod -aG docker "$ACTUAL_USER"

# Fix Docker socket permissions
if [ -S /var/run/docker.sock ]; then
    echo "Setting correct permissions for Docker socket..."
    chmod 666 /var/run/docker.sock
fi

echo "Verifying Docker installation..."
if docker --version; then
    echo "Docker installed successfully!"
else
    echo "Docker installation failed! Please check logs."
    exit 1
fi

# Post-installation instructions
echo -e "\n=== Post Installation Steps ==="
echo "To use Docker without sudo, you need to:"
echo "1. Log out and log back in, OR"
echo "2. Run this command:"
echo "   newgrp docker"
echo -e "\nTo verify installation, run:"
echo "docker run hello-world"

echo -e "\nDocker setup completed successfully!"