#!/bin/bash

# https://github.com/docker/distribution/blob/master/docs/deploying.md

docker pull registry:2

# start container with restart policy
# https://docs.docker.com/engine/articles/host_integration/

if [[ "__INSECURE_REGISTRY__" = true ]] ; then

docker run -d -p 5000:5000 --restart=always --name registry \
    -v /var/lib/registry/data:/var/lib/registry \
    registry:2

else

docker run -d -p 5000:5000 --restart=always --name registry \
    -v /var/lib/registry/data:/var/lib/registry \
    -v /certs:/certs \
    -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt \
    -e REGISTRY_HTTP_TLS_KEY=/certs/domain.key \
    registry:2
fi
