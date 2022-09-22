#!/bin/bash

###
### Docker installation
###

## add repo
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

## install
sudo yum install -y docker-ce
sudo systemctl enable docker
sudo systemctl start docker

sudo usermod -aG docker vagrant