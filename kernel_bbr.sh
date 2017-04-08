#!/bin/bash

mkdir kernel && cd kernel

wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10/linux-headers-4.10.0-041000_4.10.0-041000.201702191831_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10/linux-headers-4.10.0-041000-generic_4.10.0-041000.201702191831_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10/linux-image-4.10.0-041000-generic_4.10.0-041000.201702191831_amd64.deb

dpkg -i linux-image-4.10.0-041000-generic_4.10.0-041000.201702191831_amd64.deb
dpkg -i linux-headers-4.10.0-041000_4.10.0-041000.201702191831_all.deb
dpkg -i linux-headers-4.10.0-041000-generic_4.10.0-041000.201702191831_amd64.deb

echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
echo '重启后生效'
