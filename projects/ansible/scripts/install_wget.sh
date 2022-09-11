#!/bin/bash


# Define WGet install directory
WGET_INSTALL_DIR="/opt/wget/"

# Install C compiler (required for installing WGet)
yum install -y gcc

# Install GNU utils (required for installing WGet)
yum install -y gnutls-devel

# Dowmload latest version of WGet
curl "https://ftp.gnu.org/gnu/wget/wget-latest.tar.gz" --output "/tmp/wget.tar.gz"

# Create the install directory
mkdir "$WGET_INSTALL_DIR"

# Extract the downloaded archive in the install directory
tar -xzf "/tmp/wget.tar.gz" -C "$WGET_INSTALL_DIR" --strip-components 1

# Configure and install WGet
cd "$WGET_INSTALL_DIR" && ./configure --with-gnutls && make && make install
