#!/bin/bash

# https://github.com/docker/distribution/blob/master/docs/deploying.md

docker pull registry

# start container (will be managed by upstart after reboot)
docker run -d -p 5000:5000 --restart=always --name registry -v /var/lib/registry/data:/var/lib/registry registry:latest
