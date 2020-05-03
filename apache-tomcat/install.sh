#!/bin/sh 

dnf -y install wget

SRC_NAME=apache-tomcat
DES_PATH=/usr/local/apache-tomcat
SRC_PATH=/usr/local/src/apache-tomcat

mkdir -p $SRC_PATH
mkdir -p $DES_PATH

cd       $DES_PATH

wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.34/bin/apache-tomcat-9.0.34-fulldocs.tar.gz

tar -xzvf apache-tomcat-9.0.34-fulldocs.tar.gz

cp -pr $SRC_PATH/apache-tomcat-9.0.34 $DES_PATH/9.0.34

alternatives --remove-all                $SRC_NAME
alternatives --install $DES_PATH/current $SRC_NAME $DES_PATH/9.0.34 1

# service 登録
cp -p $SRC_PATH/apache-tomcat.service /usr/lib/systemd/system/
cp -p $SRC_PATH/apache-tomcat          /etc/sysconfig/

systemctl enable $SRC_NAME
systemctl start  $SRC_NAME