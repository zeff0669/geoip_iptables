#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install curl perl unzip xtables-addons-common libtext-csv-xs-perl libmoosex-types-netaddr-ip-perl

sudo mkdir -p /usr/share/xt_geoip
sudo wget -O /usr/local/bin/update-geoip.sh https://github.com/zeff0669/geoip_iptables/raw/main/update-geoip.sh

sudo chmod +x /usr/local/bin/update-geoip.sh
/usr/local/bin/update-geoip.sh

