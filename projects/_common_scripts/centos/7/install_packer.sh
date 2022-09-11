#!/bin/sh
#
# install Hashicorp Packer on "centos/7" box.
#
# related documentation(s):
# - Install Packer <https://learn.hashicorp.com/tutorials/packer/get-started-install-cli>
# - Autocompletion for Packer <https://www.packer.io/docs/commands#autocompletion>

# add Yum repository
yum-config-manager --add-repo "https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo"

# install packages
yum install -y packer

# install autocomplete feature
#packer -autocomplete-install
