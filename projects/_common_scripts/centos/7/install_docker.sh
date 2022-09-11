#!/bin/sh
#
# install Docker Engine on "centos/7" box.
#
# related documentation(s):
# - Install Docker Engine on CentOS <https://docs.docker.com/engine/install/centos/>

yum-config-manager \
    --add-repo "https://download.docker.com/linux/centos/docker-ce.repo"
yum install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-compose-plugin
usermod -aG docker vagrant
systemctl enable --now docker
