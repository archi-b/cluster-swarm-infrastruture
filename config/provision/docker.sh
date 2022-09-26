#!/bin/bash

###
### Docker installation
###

## add repo
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

## install Docker-Ce
sudo yum install -y docker-ce
sudo systemctl enable docker
sudo systemctl start docker

sudo usermod -aG docker vagrant

## Install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version