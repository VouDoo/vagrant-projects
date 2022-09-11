#!/bin/sh
#
# install Grafana on "centos/7" box.
#
# related documentation(s):
# - Install Grafana on RPM-based Linux <https://grafana.com/docs/grafana/latest/setup-grafana/installation/rpm/>

LASTVERSION=$(python3 -m lastversion grafana/grafana)

yum install -y https://dl.grafana.com/oss/release/grafana-${LASTVERSION}-1.x86_64.rpm
systemctl daemon-reload
systemctl enable --now grafana-server
