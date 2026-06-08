#!/bin/bash

IMAGE_NAME=situ-nginx
CONTAINER_NAME=situ-nginx

docker build -t $IMAGE_NAME .

docker run -d \
    --name $CONTAINER_NAME \
    -p 54321:443 \
    -v ./certs:/etc/nginx/certs:ro \
    $IMAGE_NAME