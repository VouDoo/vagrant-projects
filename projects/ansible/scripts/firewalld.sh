#!/bin/bash


# Start firewall
systemctl start firewalld

# Set firewall service for Jenkins
firewall-cmd --permanent --new-service=jenkins
firewall-cmd --permanent --service=jenkins --set-short="Jenkins Service Ports"
firewall-cmd --permanent --service=jenkins --set-description="Jenkins service firewalld port exceptions"
firewall-cmd --permanent --service=jenkins --add-port=8080/tcp
firewall-cmd --permanent --add-service=jenkins
firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --reload
