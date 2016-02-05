#!/bin/bash

# https://github.com/docker/distribution/blob/master/docs/deploying.md

docker pull registry

# start container with restart policy
# https://docs.docker.com/engine/articles/host_integration/
docker run -d -p 5000:5000 --restart=always --name registry -v /var/lib/registry/data:/var/lib/registry registry:latest
