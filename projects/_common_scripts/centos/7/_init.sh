#!/bin/sh
#
# initialize the "centOS/7" box.
#
# note: this must be the first script you execute on a new box.

# update all packages and install extra packages
yum update -y && yum install -y \
    yum-utils \
    curl \
    zip \
    unzip \
    vim \
    git \
    bash-completion \
    bash-completion-extras \
    gcc \
    python3 \
    python3-devel

# upgrade pip Python module
python3 -m pip install -U pip

# install and activate argcomplete Python module
python3 -m pip install argcomplete
/usr/local/bin/activate-global-python-argcomplete

# install lastversion Python module
python3 -m pip install lastversion

# enable password authentication for SSH connections
sed -i 's/#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config \
    && systemctl restart sshd
