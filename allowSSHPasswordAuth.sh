#!/bin/bash


# Set PasswordAuthentication to "yes"
sed -i 's/^PasswordAuthentication no$/PasswordAuthentication yes/g' /etc/ssh/sshd_config

# Restart SSHd
systemctl restart sshd
