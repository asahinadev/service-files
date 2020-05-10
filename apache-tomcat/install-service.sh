#!/bin/sh

TARGET=${TARGET:=/usr/local/tomcat/current}

cat << EOS > /usr/lib/systemd/system/tomcat.service
[Unit]
Description=Tomcat erver

[Service]
Type=forking
WorkingDirectory=${TARGET}
ExecStart=/${TARGET}/bin/catalina.sh start
ExecStop=/${TARGET}/bin/catalina.sh  stop

[Install]
WantedBy=multi-user.target
EOS

systemctl enable tomcat
systemctl start  tomcat
systemctl status tomcat
