#!/bin/bash


# Create installation directory and set it as current directory
mkdir "/opt/teamspeak-server" && cd "$_"

# Download TeamSpeak server 3.6.1 for Linux 64-bit
curl "https://files.teamspeak-services.com/releases/server/3.6.1/teamspeak3-server_linux_amd64-3.6.1.tar.bz2" --output "./teamspeak-server.tar.bz2"

# Extract the bzip2 archive and remove it
tar xjf "./teamspeak-server.tar.bz2" --strip-components 1 && rm "./teamspeak-server.tar.bz2"

# Create file for the TeamSpeak 3 license agreement
touch "./.ts3server_license_accepted"

# Add TeamSpeak local user
useradd teamspeak --system --shell /sbin/nologin

# Change ownership of the TeamSpeak server files
chown -R teamspeak:teamspeak "/opt/teamspeak-server"
