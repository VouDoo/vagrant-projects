#!/bin/bash


# Start firewalld
systemctl start firewalld

# Create firewalld service for TeamSpeak server
firewall-cmd --permanent --new-service=ts-server
firewall-cmd --permanent --service=ts-server --set-short="TeamSpeak Server Service Ports"
firewall-cmd --permanent --service=ts-server --set-description="TeamSpeak server service firewalld port exceptions"
firewall-cmd --permanent --service=ts-server --add-port=9987/udp
firewall-cmd --permanent --service=ts-server --add-port=10011/tcp
firewall-cmd --permanent --service=ts-server --add-port=30033/tcp

# Add the service to the public zone
firewall-cmd --zone=public --add-service=ts-server --permanent

# Reload the firewalld configuration
firewall-cmd --reload
