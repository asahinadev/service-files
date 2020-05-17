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
tar -xzfv ${TAR}
ln -snf   ${DIR} current
rm -f     ${TAR}

