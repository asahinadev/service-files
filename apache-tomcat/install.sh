#!/bin/sh

# 環境設定
MJ=${MJ:="9"}
VER=${VER:="9.0.34"}

TAR="apache-tomcat-${VER}.tar.gz"
DIR="apache-tomcat-${VER}"
URL=${URL:="http://archive.apache.org/dist/tomcat/tomcat-${MJ}/v${VER}/bin/apache-tomcat-${VER}.tar.gz"}

mkdir -p /usr/local/tomcat
cd       /usr/local/tomcat

# ダウンロード & インストール
wget $URL
tar -xzvf $TAR
rm  -rfv  $TAR
ln -snf $PWD/$DIR $PWD/current

wget https://raw.githubusercontent.com/devel-Numasawa/service-files/master/apache-tomcat/${MJ}/server.xml -O current/conf/server.xml
