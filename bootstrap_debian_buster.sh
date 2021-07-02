#!/bin/bash

# Author: Dilawar Singh <dilawar@subcom.tech>
# Run this on a fresh AWS image to bootstrap.

set -e 
set -x

#
# Docker
#
sudo apt-get install -y git apt-transport-https ca-certificates curl gnupg lsb-release make
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose
sudo usermod -a -G docker admin
sudo systemctl enable docker
sudo systemctl start docker


#
# Editor
# 
sudo apt install -y vim vim-addon-manager micro/buster-backports cmake/buster-backports
sudo apt clean all
