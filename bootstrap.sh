#!/usr/bin/env bash

# Install Docker Engine - Community
# https://docs.docker.com/install/linux/docker-ce/ubuntu/

# 1. Uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc

# 2. Set up the Docker repository

# 2.1 Update the apt package index
sudo apt-get update

# 2.2 Install packages to allow apt to use a repository over HTTPS:
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# 2.3 Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# 2.4 Set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# 3. Install Docker Engine - Community
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# 4. Post install
# 4.1 Create the docker group.
sudo groupadd docker

# 4.2 Add 'vagrant' user to the docker group
sudo usermod -aG docker vagrant

# 4.3 Activate the changes to groups
newgrp docker 

# Install Docker Compose
# https://docs.docker.com/compose/install/

# 1. Download the current stable release of Docker Compose
sudo curl -sL "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# 2. Apply executable permissions to the binary
sudo chmod +x /usr/local/bin/docker-compose
