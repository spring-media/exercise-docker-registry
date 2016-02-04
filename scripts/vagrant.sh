#!/bin/bash

# no password for users in sudo group
sudo sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=sudo' /etc/sudoers
sudo sed -i -e 's/%sudo  ALL=(ALL:ALL) ALL/%sudo  ALL=NOPASSWD:ALL/g' /etc/sudoers

pubkey_url="https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub";

adduser --disabled-password --gecos "" vagrant
echo vagrant:vagrant | chpasswd
sudo usermod -aG sudo vagrant

mkdir /home/vagrant/.ssh
wget --no-check-certificate "$pubkey_url" -O /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh
