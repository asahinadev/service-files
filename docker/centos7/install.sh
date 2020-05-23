#!/bin/sh

yum -y remove docker*

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

yum -y install docker-ce docker-ce-cli containerd.io

systemctl enable docker
systemctl start docker
