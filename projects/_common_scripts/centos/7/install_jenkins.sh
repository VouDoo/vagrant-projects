#!/bin/sh
#
# install Jenkins on "centos/7" box.

# add Yum repository
yum-config-manager --add-repo https://pkg.jenkins.io/redhat/jenkins.repo

# import public key
rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key

# install packages
yum install -y java-11-openjdk
yum install -y jenkins

# set Jenkins arguments for skipping install wizard
sed -i 's/^JENKINS_JAVA_OPTIONS=.*$/JENKINS_JAVA_OPTIONS="-Djenkins.install.runSetupWizard=false"/g' "/etc/sysconfig/jenkins"

# start and enable service
systemctl enable --now jenkins
