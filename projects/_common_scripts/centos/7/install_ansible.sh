#!/bin/sh
#
# install Ansible on "centos/7" box.
#
# related documentation(s):
# - Installing Ansible <https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html>

# install Ansible Python module
python3 -m pip install ansible

# install paramiko Python module
python3 -m pip install paramiko

# disable SSH key host checking
sed -i 's/^#host_key_checking = False$/host_key_checking = False/g' "/etc/ansible/ansible.cfg"
