#!/bin/bash

pubkey_url="https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub";

adduser --disabled-password --gecos "" vagrant
echo vagrant:vagrant | chpasswd

mkdir /home/vagrant/.ssh
wget --no-check-certificate "$pubkey_url" -O /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh
