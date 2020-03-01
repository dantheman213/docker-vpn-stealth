#!/usr/bin/env bash

source /etc/environment

echo "Starting VPN..."
docker run -v $OVPN_CONFIG_PATH:/etc/openvpn -d -p 443:1194/tcp --cap-add=NET_ADMIN --restart=always kylemanna/openvpn

echo "Configuring nginx subterfuge proxy..."
docker run -d -p 8443:80/tcp --restart=always nginx:latest
