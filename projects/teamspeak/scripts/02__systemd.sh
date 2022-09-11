#!/bin/bash


cat > "/lib/systemd/system/teamspeak.service" <<- EOF
[Unit]
Description=TeamSpeak Server
After=network.target

[Service]
WorkingDirectory=/opt/teamspeak-server
User=teamspeak
Group=teamspeak
Type=forking
ExecStart=/opt/teamspeak-server/ts3server_startscript.sh start inifile=ts3server.ini
ExecStop=/opt/teamspeak-server/ts3server_startscript.sh stop
PIDFile=/opt/teamspeak-server/ts3server.pid
RestartSec=15
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Reload the systemd manager configuration
systemctl --system daemon-reload

# Enable and start TeamSpeak server
systemctl enable --now teamspeak.service
