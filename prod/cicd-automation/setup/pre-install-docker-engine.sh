#!/bin/bash

# Script to install Docker Engine on a Jenkins server (Ubuntu/Debian-based systems)

# Exit immediately if any command fails
set -e

# Update the package list
echo "Updating package list..."
sudo apt-get update

# Install required packages to allow apt to use a repository over HTTPS
echo "Installing required packages..."
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker's official GPG key
echo "Adding Docker's GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker's stable repository
echo "Adding Docker's repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package list again
echo "Updating package list with Docker repository..."
sudo apt-get update

# Install Docker Engine
echo "Installing Docker Engine..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Add the current user to the docker group to run Docker without sudo
echo "Adding the current user to the docker group..."
sudo usermod -aG docker $USER

# Start and enable Docker service
echo "Starting and enabling Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

# Verify Docker installation
echo "Verifying Docker installation..."
docker --version

echo "Docker Engine has been successfully installed and configured!"