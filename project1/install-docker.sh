#!/bin/bash

echo "Detecting Ubuntu version..."
UBUNTU_VERSION=$(lsb_release -rs)

echo "Your Ubuntu version: $UBUNTU_VERSION"

echo "Updating package index..."
sudo apt update -y

echo "Installing required dependencies..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

if [[ "$UBUNTU_VERSION" == "14.04" ]]; then
    echo "Installing Docker using 'docker.io' for Ubuntu 14.04..."
    sudo apt install -y docker.io
    echo "Starting Docker service..."
    sudo service docker start
    echo "Enabling Docker service on boot..."
    sudo update-rc.d docker defaults

elif [[ "$UBUNTU_VERSION" == "16.04" ]]; then
    echo "Installing Docker CE (legacy method for Ubuntu 16.04)..."
    sudo apt install -y docker.io
    echo "Starting Docker service..."
    sudo systemctl start docker
    sudo systemctl enable docker

else
    echo "Adding Docker's official GPG key..."
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    echo "Adding Docker repository..."
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    echo "Updating package index again..."
    sudo apt update -y

    echo "Installing Docker CE..."
    sudo apt install -y docker-ce docker-ce-cli containerd.io

    echo "Starting and enabling Docker service..."
    sudo systemctl start docker
    sudo systemctl enable docker
fi

echo "Adding the current user ($USER) to the 'docker' group..."
sudo usermod -aG docker $USER

echo "Verifying Docker installation..."
docker --version || echo "Docker installation failed! Please check logs."

echo "Docker setup completed successfully!"