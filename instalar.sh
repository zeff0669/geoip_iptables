#!/bin/bash

#Atualiza Sistema
apt update -y
apt upgrade -y
#Pacotes necessários
apt -y install curl perl unzip xtables-addons-common libtext-csv-xs-perl libmoosex-types-netaddr-ip-perl
#Atualiza banco de dados xt_geoip
mkdir -p /usr/share/xt_geoip
wget -O /usr/local/bin/update-geoip.sh https://github.com/zeff0669/geoip_iptables/raw/main/update-geoip.sh
chmod +x /usr/local/bin/update-geoip.sh
/usr/local/bin/update-geoip.sh
#Aplica as regras Iptables 
wget -O /usr/local/bin/iptables_br_only.sh  https://github.com/zeff0669/geoip_iptables/raw/main/iptables_br_only.sh && chmod +x /usr/local/bin/iptables_br_only.sh && bash /usr/local/bin/iptables_br_only.sh


#adiciona entradas iptables para autoinicialização 
if [[ ! -e /etc/rc.local ]]; then
  echo "#!/bin/sh -e\n\nexit 0" >/etc/rc.local
  chmod +x /etc/rc.local
fi
sed -i "1 a\bash /usr/local/bin/iptables_br_only.sh" /etc/rc.local

