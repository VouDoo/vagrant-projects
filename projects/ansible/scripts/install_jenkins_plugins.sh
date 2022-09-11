#!/bin/bash


# Get Jenkins Cli client JAR file
/usr/local/bin/wget --tries=60 --waitretry=1 --retry-connrefused --retry-on-http-error=503 "http://localhost:8080/jnlpJars/jenkins-cli.jar" -P "/home/vagrant"

# Install Ansible plugin on Jenkins
java -jar "/home/vagrant/jenkins-cli.jar" -s "http://localhost:8080/" install-plugin "ansible"

# Restart Jenkins
systemctl restart jenkins
