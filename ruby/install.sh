#!/bin/sh

# 環境設定
MJ=${MJ:="2.7"}
VER=${VER:="2.7.1"}
TAR="ruby-${VER}.tar.gz"
DIR="ruby-${VER}"
RUBY_UR=RUBY_UR:="https://cache.ruby-lang.org/pub/ruby/${MJ}/${TAR}"}
PRIORITY=${PRIORITY:=1}

# 前提インストール
dnf -y groupinstall "Development Tools"
dnf -y install wget

mkdir -p /usr/local/src/ruby
cd       /usr/local/src/ruby

# ダウンロード & インストール
wget $RUBY_URL
tar -xzf ${TAR}
cd ${DIR}
./configure --disable-install-doc --prefix=/usr/local/ruby/${DIR}

make
make test
make install

alternatives \
 --install  ${DD}/ruby   ruby        ${SD}/ruby   ${PRIORITY} \
 --slave    ${DD}/bundle ruby-bundle ${SD}/bundle \
 --slave    ${DD}/erb    ruby-erb    ${SD}/erb    \
 --slave    ${DD}/gem    ruby-gem    ${SD}/gem    \
 --slave    ${DD}/irb    ruby-irb    ${SD}/irb    \
 --slave    ${DD}/racc   ruby-racc   ${SD}/racc   \
 --slave    ${DD}/racc2y ruby-racc2y ${SD}/racc2y \
 --slave    ${DD}/y2racc ruby-y2racc ${SD}/y2racc \
 --slave    ${DD}/rdoc   ruby-rdoc   ${SD}/rdoc   \
 --slave    ${DD}/ri     ruby-ri     ${SD}/ri     
