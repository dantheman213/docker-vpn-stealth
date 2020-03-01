#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Provide domain where VPN will be hosted at. (e.g. subdomain.mydomain.com or mydomain.com)"
    exit 1
fi

start=`date +%s`

echo "Saving env vars..."
mkdir -p /etc/openvpn/creds
echo "export OVPN_CONFIG_PATH=/etc/openvpn" >> /etc/environment
echo "export OVPN_CONFIG_CREDS_PATH=/etc/openvpn/creds" >> /etc/environment
echo "export OVPN_DOMAIN=$1" >> /etc/environment

source /etc/environment

echo "Upgrading system and installing dependencies..."
apt-get update
apt-get upgrade -y
apt-get install -y docker

echo "Configuring ufw firewall..."
ufw default deny incoming
ufw allow 22
ufw allow 443/tcp
ufw --force enable # non-interactive

echo "Grab DockerHub VPN image..."
echo "Generate OVPN config..."
docker run -v $OVPN_CONFIG_PATH:/etc/openvpn --log-driver=none --net=none --rm kylemanna/openvpn ovpn_genconfig -u tcp://$OVPN_DOMAIN:443

echo "Generate OVPN keys and certificates..."
docker run -v $OVPN_CONFIG_PATH:/etc/openvpn --log-driver=none --net=none -e EASYRSA_KEY_SIZE=4096 --rm -it kylemanna/openvpn ovpn_initpki nopass

end=`date +%s`
runtime=$((end-start))
runtime_pretty=$(date -d@$runtime -u +%H:%M:%S)

printf "\n\nTotal time is $runtime_pretty.\nCOMPLETE!\n"
