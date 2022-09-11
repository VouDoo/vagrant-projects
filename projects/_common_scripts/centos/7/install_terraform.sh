#!/bin/sh
#
# install Hashicorp Terraform on "centos/7" box.
#
# related documentation(s):
# - Install Terraform <https://learn.hashicorp.com/tutorials/terraform/install-cli>
# - Shell Tab-completion for Terraform <https://www.terraform.io/cli/commands#shell-tab-completion>

# add Yum repository
yum-config-manager --add-repo "https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo"

# install packages
yum install -y terraform

# install autocomplete feature
#terraform -install-autocomplete
