#!/bin/bash

# Create SSH keypair
[ ! -f docker/id_rsa.pub ] && ssh-keygen -b 2048 -t rsa -f docker/id_rsa -q -N ""

# Build image
docker build -t docker-firefox docker

# Start container
CONTAINER_ID=`docker run -d -p 50000:22 docker-firefox`

# Connect to container and run Firefox
ssh user@127.0.0.1 -p 50000 \
-i docker/id_rsa \
-X -R 50001:127.0.0.1:4713 \
-o StrictHostKeyChecking=no \
-o UserKnownHostsFile=/dev/null \
/home/user/run-firefox

# Stop and delete container
docker stop $CONTAINER_ID
docker rm $CONTAINER_ID
