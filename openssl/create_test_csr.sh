#!/bin/sh

if [ $# -lt 2 ]; then
  echo "usage: $0 <fqdn> <passphrase> [<city>] [<pref>]"
  echo "pref : default => KANAGAWA"
  echo "city : default => YOKOHAMA"
  exit 1;
fi


echo "-------------------------------------------------------"
CN=$1
PP=$2
CITY=$3
PREF=$4

# default
CITY=${CITY:=YOKOHAMA}
PREF=${PREF:=KANAGAWA}

echo CN=$CN
echo PP=$PP
echo CITY=$CITY
echo PREF=$PREF

echo "-------------------------------------------------------"
echo 対話式で入力するdistinguished nameを一度に指定。コモンネームは第1引数
SJ="/C=JP/ST=$PREF/L=$CITY/O=$CN/OU=$CN/CN=$CN"
echo $SJ

echo 秘密鍵を作成
openssl genrsa -des3 -passout pass:$PP -out $CN.key 2048

echo "-------------------------------------------------------"
echo パスフレーズなしの秘密鍵にする
openssl rsa -passin pass:$PP -in $CN.key -out $CN.key

echo "-------------------------------------------------------"
echo CSR出力
openssl req -new -sha256 -key $CN.key -out $CN.csr -subj "$SJ"

echo "-------------------------------------------------------"
echo 確認のためにCSR内容を表示
openssl req -noout -text -in $CN.csr

echo "-------------------------------------------------------"
echo server.csrとserver.keyを指定して server.crtを作成する
openssl x509 -req -in $CN.csr -signkey $CN.key -sha256 -days 36500 -out $CN.crt

echo "-------------------------------------------------------"
echo 証明書ファイルの内容を表示
openssl x509 -text -noout -in $CN.crt

echo "-------------------------------------------------------"
echo 証明書ファイルのfingerprintを表示
openssl x509 -fingerprint -noout -in $CN.crt

echo "-------------------------------------------------------"
echo 秘密鍵から公開鍵を作成する
openssl rsa -pubout -in $CN.key -out $CN.pub

echo "-------------------------------------------------------"
echo 公開鍵を確認する
openssl rsa -text -pubin  < $CN.pub

echo "-------------------------------------------------------"
echo PKCS#12作成
openssl pkcs12 -export -in $CN.crt -inkey $CN.key -out $CN.p12 -password pass:$PP

echo "-------------------------------------------------------"
echo "PKCS#12確認"
openssl pkcs12 -in $CN.p12  -info -noout -password pass:$PP
