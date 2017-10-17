#!/bin/bash

mkdir temp-kernel && cd temp-kernel

wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.13.7/linux-headers-4.13.7-041307_4.13.7-041307.201710141430_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.13.7/linux-headers-4.13.7-041307-generic_4.13.7-041307.201710141430_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.13.7/linux-image-4.13.7-041307-generic_4.13.7-041307.201710141430_amd64.deb

dpkg -i *.deb

cd ..
rm -rf temp-kernel

echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf

echo '10s 后重启生效'
sleep 10

reboot
