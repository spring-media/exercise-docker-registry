#!/bin/bash

echo "UseDNS no" >> /etc/ssh/sshd_config

cat << EOF >/etc/network/interfaces
# The host-only network interface
auto eth1
iface eth1 inet static
address 192.168.56.101
netmask 255.255.255.0
network 192.168.56.0
broadcast 192.168.56.255
EOF
