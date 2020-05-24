#!/bin/sh

yum -y remove docker*

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

yum -y install docker-ce docker-ce-cli containerd.io

wget https://github.com/docker/compose/releases/download/1.25.5/docker-compose-Linux-x86_64 -O /usr/local/bin/docker-compose

systemctl enable docker
systemctl start docker
