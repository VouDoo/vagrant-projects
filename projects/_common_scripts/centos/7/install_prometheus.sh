#!/bin/sh
#
# install Prometheus on "centos/7" box.

LASTVERSION=$(python3 -m lastversion prometheus/prometheus)

useradd -rs /bin/false prometheus
curl -LO https://github.com/prometheus/prometheus/releases/download/v${LASTVERSION}/prometheus-${LASTVERSION}.linux-amd64.tar.gz
mkdir -p /opt/prometheus/data
tar -xzf prometheus-${LASTVERSION}.linux-amd64.tar.gz -C /opt/prometheus --strip 1
chown prometheus:prometheus -R /opt/prometheus
cat > /etc/systemd/system/prometheus.service << EOF
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target
[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/opt/prometheus/prometheus \
    --config.file /opt/prometheus/prometheus.yml \
    --web.console.templates=/opt/prometheus/consoles/ \
    --web.console.libraries=/opt/prometheus/console_libraries/ \
    --storage.tsdb.path /opt/prometheus/data/ \
    --storage.tsdb.retention.time=2d \
    --storage.tsdb.wal-compression \
    --log.level=warn
[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable --now prometheus
