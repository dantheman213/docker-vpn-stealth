#!/usr/bin/env bash

source /etc/environment
docker run -v $OVPN_CONFIG_PATH:/etc/openvpn -d -p 443:1194/tcp --cap-add=NET_ADMIN kylemanna/openvpn
