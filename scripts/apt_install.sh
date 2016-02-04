#!/bin/bash

sudo apt-get update -y -qq
sudo apt-get upgrade -y -qq

DEBIAN_FRONTEND=noninteractive sudo apt-get -y install curl wget unzip vim puppet virtualbox-guest-utils
