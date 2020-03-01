# docker-vpn-stealth

Turn-key deploy anonymous VPN that can be accessed from very restricted networks by mimicing standard TLS traffic on HTTPS port.

## How It Works

Docker and Compose are leveraged to quickly standup a VPN with best practices towards security and stealth.

## Getting Started

Example below is a fresh Ubuntu 18.04 LTS server in the cloud.

### Setup

```
git clone https://github.com/dantheman213/docker-vpn-stealth
cd docker-vpn-stealth/bin
./setup.sh mydomain.com
```

When prompted for a Common Name press `[ENTER]` without any other input.

### Start Service

```
./start.sh
```

### Adding User(s)

Run this command for every new user that you need. You will be provided path to credentials.

```
./create-user.sh
```

### Connect To VPN

After you've downloaded your *.ovpn file you can use a variety of OpenVPN clients on all popular desktop and mobile Operating Systems. Import file into your OpenVPN client and connect to server. That should be it.

## Security

TODO

## Reference

* https://github.com/kylemanna/docker-openvpn

* https://www.vpnmentor.com/blog/make-vpn-undetectable/

* https://discourse.criticalengineering.org/t/hiding-openvpn-traffic-from-network-opponents/418

* https://openvpn.net/community-resources/reference-manual-for-openvpn-2-4/
