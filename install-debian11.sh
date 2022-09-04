#!/bin/bash
export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin

cd /opt
wget https://github.com/brunxor/brunxor/raw/main/cliente-tfm.tar.gz
tar -xvf cliente-tfm.tar.gz

systemctl enable /opt/client/tfm-agent.service

apt update
apt install -y python3-pip nmap snapd

pip3 install ifaddr
pip3 install getmac

snap install core
snap install amass
ln -s /snap/bin/amass /usr/bin/amass

systemctl start tfm-agent
