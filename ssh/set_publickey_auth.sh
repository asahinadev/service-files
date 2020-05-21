#!/bin/sh

SSHD_CONFIG=${SSHD_CONFIG:="/etc/ssh/sshd_config"}
PORT=${PORT:=22}

cp -pn $SSHD_CONFIG $SSHD_CONFIG.$(date -I)

# 鍵認証を有効にする
sed -i "/PubkeyAuthentication/ s/^.\+/PubkeyAuthentication yes/g" $SSHD_CONFIG
grep PubkeyAuthentication $SSHD_CONFIG

# ポートの変更
sed -i "/Port / s/^.\+/Port $POR:wT/g" $SSHD_CONFIG 
grep Port $SSHD_CONFIG

# root の 無効化
sed -i "/^#\?PermitRootLogin/ s/^.\+/PermitRootLogin no/g" $SSHD_CONFIG 
grep PermitRootLogin $SSHD_CONFIG

# パスワードログインの無効化
sed -i "/^#\?PasswordAuthentication/ s/^.\+/PasswordAuthentication no/g" $SSHD_CONFIG 
grep PasswordAuthentication  $SSHD_CONFIG
