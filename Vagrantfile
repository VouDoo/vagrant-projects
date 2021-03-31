#!/usr/bin/ruby
# -*- mode: ruby -*-


# Vagrantfile
#
# DESCRIPTION
# ~~~~~~~~~~~
# Deploy a Docker swarm with a manager and workers
#
# NOTES
# ~~~~~
# This Vagrantfile uses VirtualBox as provider
# Make sure that VirtualBox is installed on your machine
# To install it, please visit the official Website:
#   https://www.virtualbox.org/wiki/Downloads
#
# Use the following command to spin up the boxes:
#   vagrant up
#
# PARAMTERS
# ~~~~~~~~~
# Define virtual machines' resources
# Number of CPUs per machine
vm_cpus = 1
# Allocated RAM per machine
vm_memory = 512
# Define network for the virtual machines' private network
# Use only CIDR length /24 for the prefix IPv4
prefix_ip = "192.168.22"
# Define Docker Swarm manager IPv4
# It is strongly recommended to leave it by default
manager_instance_ip = "#{prefix_ip}.100"
# Define number of Docker Swarm worker instances
# Keep in mind that the Docker Swarm manager is a worker as well so containers will run on it.
worker_instances_count = 2

# Initialize Docker Swarm instances
instances = []
# Push manager node
instances.push(
  {
    :name => "manager",
    :ip => manager_instance_ip,
    :type => "m" # As manager node
  }
)
# Push worker nodes
(1..worker_instances_count).each do |c|
  instances.push(
    {
      :name => "worker#{c}",
      :ip => "#{prefix_ip}.#{100 + c}",
      :type => "w" # As worker node
    }
  )
end

Vagrant.configure("2") do |config|
  # Set virtual machines ressources on VirtualBox
  config.vm.provider :virtualbox do |v|
    v.cpus = vm_cpus
    v.memory = vm_memory
  end
  # Provision Docker Swarm instances
  instances.each do |instance|
    config.vm.define instance[:name] do |i|
      i.vm.box = "centos/7"
      i.vm.hostname = instance[:name]
      i.vm.network :private_network, ip: "#{instance[:ip]}"
      i.vm.provider :virtualbox do |v|
        v.name = instance[:name]
        v.customize ["modifyvm", :id, "--groups", "/docker-swarm"]
      end
      # Populate hosts files
      instances.each do |instance|
        i.vm.provision "shell", inline: "echo '#{instance[:ip]} #{instance[:name]}' >> /etc/hosts"
      end
      # Set SSH password authentication to "yes"
      i.vm.provision "shell", path: "scripts/allowSSHPasswordAuth.sh"
      # Install Docker CE package
      i.vm.provision "shell", path: "scripts/installDockerCE.sh"
      if instance[:type] == "m" # for Manager node
        # Initialize Docker swarm
        i.vm.provision "shell", inline: "docker swarm init --advertise-addr #{instance[:ip]}"
        # Save token in file
        i.vm.provision "shell", inline: "docker swarm join-token -q worker > /vagrant/DockerSwarmToken"
      elsif instance[:type] == "w" # for Worker node
        # Join Docker swarm
        i.vm.provision "shell", inline: "yum install -y sshpass && docker swarm join --advertise-addr #{instance[:ip]} --listen-addr #{instance[:ip]}:2377 --token `sshpass -p vagrant ssh -oStrictHostKeyChecking=no vagrant@#{manager_instance_ip} cat /vagrant/DockerSwarmToken` #{manager_instance_ip}:2377"
      end
    end
  end
end
