#!/bin/sh
#
# install Hashicorp Vault on "centos/7" box.
#
# related documentation(s):
# - Install Vault <https://learn.hashicorp.com/tutorials/vault/getting-started-install>
# - Autocompletion for Vault <https://www.vaultproject.io/docs/commands#autocompletion>

# add Yum repository
yum-config-manager --add-repo "https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo"

# install packages
yum install -y vault

# install autocomplete feature
#vault -install-autocomplete
