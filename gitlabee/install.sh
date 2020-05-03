#!/bin/sh 

dnf -y install wget

SRC_NAME=gitlab-ee
SRC_PATH=/usr/local/src/gitlab-ee
EXTERNAL_URL=$1
EXTERNAL_URL=${EXTERNAL_URL:=https://gitlab.example.com}

mkdir -p $DES_PATH

cd       $DES_PATH

wget https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh
/bin/sh ./script.rpm.sh

yum install -y gitlab-ee

# service 登録
cp -p $SRC_PATH/gitlab-ee.service /usr/lib/systemd/system/
cp -p $SRC_PATH/gitlab-ee         /etc/sysconfig/

systemctl enable $SRC_NAME
systemctl start  $SRC_NAME