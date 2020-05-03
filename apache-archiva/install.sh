#!/bin/sh 

dnf -y install wget

SRC_NAME=apache-archiva
DES_PATH=/usr/local/apache-archiva
SRC_PATH=/usr/local/src/apache-archiva

mkdir -p $SRC_PATH
mkdir -p $DES_PATH

cd       $DES_PATH

wget https://downloads.apache.org/archiva/2.2.4/binaries/apache-archiva-2.2.4-bin.tar.gz

tar -xzvf apache-archiva-2.2.4-bin.tar.gz

cp -pr $SRC_PATH/apache-archiva-2.2.4 $DES_PATH/2.2.4

alternatives --remove-all                $SRC_NAME
alternatives --install $DES_PATH/current $SRC_NAME $DES_PATH/2.2.4 1

# service 登録
cp -p $SRC_PATH/apache-archiva.service /usr/lib/systemd/system/
cp -p $SRC_PATH/apache-tomcat          /etc/sysconfig/

systemctl enable $SRC_NAME
systemctl start  $SRC_NAME