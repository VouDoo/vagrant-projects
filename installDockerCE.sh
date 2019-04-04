#!/bin/bash


# Install the pre-requisites for Docker
yum install -y yum-utils device-mapper-persistent-data lvm2

# Add Docker CE stable repository
yum-config-manager --add-repo "https://download.docker.com/linux/centos/docker-ce.repo"

# Install Docker CE package
yum install -y docker-ce

# Enable Docker
systemctl enable docker

# Start Docker
systemctl start docker
