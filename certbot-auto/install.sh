#!/bin/sh

wget https://dl.eff.org/certbot-auto /usr/local/bin/certbot-auto
chmod 700 /usr/local/bin/certbot-auto

mkdir -p var/log/certbot-auto
