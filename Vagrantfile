# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

# Load settings from servers.yml file.
environment = YAML.load_file('env.yml')

IP_MASK="192.168.56."
IP_START=10

Vagrant.configure("2") do |config|

  COUNT_MACHINE=IP_START

  environment["servers"].each do |server|    
    config.vm.define server["name"] do |node|
      
      node.vm.box = environment["box"]
      node.vm.hostname = server["name"]
      node.vm.network :private_network, ip: "#{IP_MASK}" + "#{COUNT_MACHINE}"
      #node.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
      #node.vm.network "public_network"

      COUNT_MACHINE+=1

      node.vm.provider "virtualbox" do |vb|
        vb.name = server["name"]
        vb.cpus = server["cpu"]
        vb.memory = server["mem"]
        vb.gui = false
      end

      # chamada do script para definir o /etc/hosts
      COUNT_HOST=IP_START
      environment["servers"].each do |server|
        node.vm.provision "shell", env: { "IP_MASK" => IP_MASK, "COUNT_HOST" => COUNT_HOST, "HOSTNAME" => server["name"] }, inline: <<-SHELL
        echo "$IP_MASK$((COUNT_HOST)) $HOSTNAME" >> /etc/hosts
        SHELL
        COUNT_HOST+=1
      end

      node.vm.provision "shell", path: "config/provision/utils.sh"
      node.vm.provision "shell", path: "config/provision/docker.sh"
      #node.vm.provision "shell", path: "config/provision/kubernetes.sh"
    end
  end
end