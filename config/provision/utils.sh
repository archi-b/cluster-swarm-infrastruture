#!/bin/bash

sudo yum install -y net-tools

sudo yum install epel-release mlocate tcpdump net-tools traceroute vim git wget curl yum-utils device-mapper-persistent-data lvm2 telnet httpd nmap lsof -y
sudo echo "docker          2377/tcp                # Docker" >> /etc/services
sudo systemctl start httpd
sudo systemctl enable httpd