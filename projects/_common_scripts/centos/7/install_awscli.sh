#!/bin/sh
#
# install and configure AWS CLI on "centos/7" box.
#
# note: do not run this script as "root" user, run it as "vagrant" user.

# install awscli Python module
python3 -m pip install --user awscli
