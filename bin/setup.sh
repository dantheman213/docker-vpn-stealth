#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Provide domain where VPN will be hosted at. (e.g. subdomain.mydomain.com or mydomain.com)"
fi

mkdir -p /etc/openvpn/creds
echo "export OVPN_CONFIG_PATH=/etc/openvpn" >> /etc/environment
echo "export OVPN_CONFIG_CREDS_PATH=/etc/openvpn/creds" >> /etc/environment
echo "export OVPN_DOMAIN=$1" >> /etc/environment

source /etc/environment

apt-get update
apt-get upgrade -y
apt-get install -y docker docker-compose

ufw default deny incoming
ufw allow 22
ufw allow 443/tcp
ufw --force enable # non-interactive

docker run -v $OVPN_CONFIG_PATH:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_genconfig -C 'AES-256-CBC' -a 'SHA384' -u tcp://$OVPN_DOMAIN:443
docker run -v $OVPN_CONFIG_PATH:/etc/openvpn --log-driver=none --rm -it -e EASYRSA_KEY_SIZE=4096 kylemanna/openvpn ovpn_initpki nopass
