#!/bin/bash

mkdir temp-kernel && cd temp-kernel

wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.12.6/linux-headers-4.12.6-041206_4.12.6-041206.201708111232_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.12.6/linux-headers-4.12.6-041206-generic_4.12.6-041206.201708111232_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.12.6/linux-image-4.12.6-041206-generic_4.12.6-041206.201708111232_amd64.deb

dpkg -i *.deb

cd ..
rm -rf temp-kernel

echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf

echo '10s 后重启生效'
sleep 10

reboot
