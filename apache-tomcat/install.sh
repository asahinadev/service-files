#!/bin/sh

# 環境設定
MJ=${MJ:="9"}
VER=${VER:="9.0.34"}
TAR="apache-tomcat-${VER}.tar.gz"
DIR="apache-tomcat-${VER}"
URL=${URL:="http://archive.apache.org/dist/tomcat/tomcat-${MJ}/v${VER}/bin/apache-tomcat-${VER}.tar.gz"}
HTTP=${HTTP:=9301}
AJP=${AJP:=9300}

mkdir -p /usr/local/tomcat
cd       /usr/local/tomcat

# ダウンロード & インストール
wget $URL
tar -xzf ${TAR}
ln -snf  ${DIR} current
rm -f ${TAR}

sed -i "s/port=\"8080\"/port=\"${PORT}\"/g" ${DIR}/conf/server.xml 
sed -i "s/port=\"8009\"/port=\"${AJP}\"/g"  ${DIR}/conf/server.xml 
ed -i '$ i \ \ \ \ <Valve className="org.apache.catalina.valves.ErrorReportValve" showReport="false" showServerInfo="fa
lse"/>' context.xml
