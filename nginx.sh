#!/bin/bash

apt update
apt install gcc make wget

mkdir nginx_build_install
cd nginx_build_install

wget https://nginx.org/download/nginx-1.12.1.tar.gz
wget https://zlib.net/zlib-1.2.11.tar.gz
wget https://ftp.pcre.org/pub/pcre/pcre-8.41.tar.gz
wget https://www.openssl.org/source/openssl-1.0.2l.tar.gz

tar zxvf nginx-1.12.1.tar.gz
mv nginx-1.12.1 nginx

tar zxvf zlib-1.2.11.tar.gz
mv zlib-1.2.11 zlib

tar zxvf pcre-8.41.tar.gz
mv pcre-8.41 pcre

tar zxvf openssl-1.0.2l.tar.gz
mv openssl-1.0.2l openssl

cd nginx

./configure \
    --with-zlib=../zlib \
    --with-pcre --with-pcre=../pcre \
    --with-http_ssl_module --with-openssl=../openssl \
    --with-http_v2_module 

make && make install

echo 'nginx make install success'
