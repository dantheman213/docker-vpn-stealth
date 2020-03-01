# docker-vpn-stealth

Turn-key deploy anonymous VPN that can be accessed from very restricted networks by mimicking standard TLS traffic on HTTPS port.

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

### Compression

```
Compression and encryption is a tricky combination. If an attacker knows or is able to control (parts of) the plaintext of packets that contain secrets, the attacker might be able to extract the secret if compression is enabled. See e.g. the CRIME and BREACH attacks on TLS which also leverage compression to break encryption. If you are not entirely sure that the above does not apply to your traffic, you are advised to *not* enable compression.
```

https://community.openvpn.net/openvpn/wiki/Openvpn24ManPage

## Reference

* https://github.com/kylemanna/docker-openvpn

* https://www.vpnmentor.com/blog/make-vpn-undetectable/

* https://discourse.criticalengineering.org/t/hiding-openvpn-traffic-from-network-opponents/418

* https://openvpn.net/community-resources/reference-manual-for-openvpn-2-4/

* https://security.stackexchange.com/questions/94390/whats-the-purpose-of-dh-parameters

* https://stackoverflow.com/questions/10061532/why-chose-sha512-over-sha384

* https://security.stackexchange.com/questions/184305/why-would-i-ever-use-aes-256-cbc-if-aes-256-gcm-is-more-secure
