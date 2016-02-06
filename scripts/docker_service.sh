#!/bin/bash

#cat << EOF > /etc/init/docker-registry.conf
#description "Docker Registry"
#author "Jonathan Colby"
#start on filesystem and started docker
#stop on runlevel [!2345]
#respawn
#script
#  /usr/bin/docker start -a registry
#end script
#EOF
#
## reload init files
#initctl reload-configuration
