#!/bin/bash

####################################
install_home="/etc/shadowsocks/" # 安装目录
port=888;                        # 端口
password="password"              # 密码
encrypt="chacha20-ietf-poly1305" # 加密方式
####################################

systemctl stop firewalld
systemctl disable firewalld

rm -rf $install_home
mkdir -p $install_home

yum update -y

yum -y install epel-release
yum install -y python-pip git gcc gcc-c++ make
pip install --upgrade pip
pip install setuptools
# pip install shadowsocks
pip install git+https://github.com/shadowsocks/shadowsocks.git@master

cd $install_home

cat > $install_home/config.json <<EOF
{
    "server":"0.0.0.0",
    "server_port":$port,
    "password":"$password",
    "method":"$encrypt"
}
EOF

wget https://github.com/jedisct1/libsodium/releases/download/1.0.15/libsodium-1.0.15.tar.gz
tar zxvf libsodium-1.0.15.tar.gz
cd libsodium-1.0.15
./configure
make && make install 

echo "/usr/local/lib" > /etc/ld.so.conf.d/usr_local_lib.conf
ldconfig

start_cmd="ssserver -c "$install_home"config.json -d start"
$start_cmd
echo 'shadowsocks 服务已启动'
sleep 3

echo $start_cmd >> /etc/rc.local
chmod +x /etc/rc.d/rc.local

echo "安装成功,已加入开机自启,端口:$port 密码:$password 加密方式:$encrypt"
