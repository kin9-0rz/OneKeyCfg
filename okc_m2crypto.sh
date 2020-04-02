#!/bin/sh

yum install m2crypto gcc -y
wget https://download.libsodium.org/libsodium/releases/LATEST.tar.gz
tar xzvf LATEST.tar.gz
cd libsodium*
./configure
make && make install
echo "include ld.so.conf.d/*.conf" > /etc/ld.so.conf
echo "/lib" >> /etc/ld.so.conf
echo "/usr/lib64" >> /etc/ld.so.conf
echo "/usr/local/lib" >> /etc/ld.so.conf
ldconfig
