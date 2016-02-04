#!/bin/bash

# install docker according to instuctions at:
# https://docs.docker.com/engine/installation/ubuntulinux/

# add the docker gpg key
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Add the Docker repository to your apt sources list.
echo deb https://apt.dockerproject.org/repo ubuntu-trusty main > /etc/apt/sources.list.d/docker.list

# apt update
sudo apt-get update -y -qq
sudo apt-get purge lxc-docker

# install docker and some useful packages
DEBIAN_FRONTEND=noninteractive sudo apt-get -y install linux-image-extra-$(uname -r)
DEBIAN_FRONTEND=noninteractive sudo apt-get -y install docker-engine
