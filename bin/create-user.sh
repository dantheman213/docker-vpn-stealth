#!/usr/bin/env bash

source /etc/environment

USERNAME=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)

# Generate creds
docker run -v $OVPN_CONFIG_PATH:/etc/openvpn --log-driver=none -e EASYRSA_KEY_SIZE=4096 --rm -it kylemanna/openvpn easyrsa build-client-full $USERNAME nopass

# Get creds
OUTPUT_FILE=$OVPN_CONFIG_CREDS_PATH/$USERNAME.ovpn
echo "Writing to file $OUTPUT_FILE"
docker run -v $OVPN_CONFIG_PATH:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_getclient $USERNAME > $OUTPUT_FILE
