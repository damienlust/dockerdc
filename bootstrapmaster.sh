#!/bin/bash

echo “Install Docker latest Beta version”
curl -fsSL https://test.docker.com/ | sh


echo `date`
start=`date +%s`

export SCRIPT_PATH=/vagrant
 
echo “Install UCP”

# ucp
docker run --rm -t --name ucp \
-v /var/run/docker.sock:/var/run/docker.sock \
-v docker_subscription.lic:/docker_subscription.lic \
-v /etc/hosts:/etc/hosts \
docker/ucp install \
--debug \
--swarm-port 3376 \
--host-address 10.100.198.200 \
--controller-port 8443


