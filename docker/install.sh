#!/bin/sh

# ツール インストール
yum install -y yum-utils device-mapper-persistent-data lvm2

# リポジトリ設定
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# docker インストール
yum install -y docker-ce docker-ce-cli containerd.io
systemctl enable docker
systemctl start  docker
 
