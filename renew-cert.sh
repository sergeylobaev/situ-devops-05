#!/bin/bash

CERT_DIR=./certs
CONTAINER_NAME=situ-nginx

openssl req -x509 \
    -nodes \
    -days 365 \
    -newkey rsa:2048 \
    -keyout $CERT_DIR/nginx.key \
    -out $CERT_DIR/nginx.crt \
    -subj "/C=RU/ST=Perm/L=Perm/O=SITU/OU=PSU/CN=localhost"

docker exec $CONTAINER_NAME nginx -s reload

echo "Certificate renewed and nginx reloaded"
