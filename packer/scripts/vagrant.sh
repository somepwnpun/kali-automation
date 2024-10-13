#!/usr/bin/env bash

mkdir /home/somepwnpun/.ssh
wget -O /home/somepwnpun/.ssh/authorized_keys https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub
chmod 0700 /home/somepwnpun/.ssh/
chmod 0600 /home/somepwnpun/.ssh/authorized_keys
chown -R somepwnpun:somepwnpun /home/somepwnpun/.ssh/

echo 'UseDNS no' >> /etc/ssh/sshd_config

echo -e "auto eth0\niface eth0 inet dhcp" >> /etc/network/interfaces
