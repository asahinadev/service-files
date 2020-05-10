#!/bin/sh

# working　ディレクトリ
mkdir -p /usr/local/src/redmine
cd       /usr/local/src/redmine

# 必要ツール インストール
dnf config-manager --enable  PowerTools
dnf -y groupinstall "Development Tools"
dnf -y install \
 openssl-devel readline-devel zlib-devel curl-devel libyaml-devel \
 libffi-devel  ${DBMS}-server ${DBMS}-devel httpd httpd-devel \
 ImageMagick ImageMagick-devel zip unzip wget

# IPA フォント インストール
wget https://ipafont.ipa.go.jp/IPAexfont/IPAexfont00401.zip
unzip IPAexfont00401.zip
mkdir -p IPAexfont00401/ipaexg.ttf /usr/share/fonts/ipaexfont-gothic
mkdir -p IPAexfont00401/ipaexm.ttf /usr/share/fonts/ipaexfont-mincho
cp -pv IPAexfont00401/ipaexg.ttf /usr/share/fonts/ipaexfont-gothic/ipaexg.ttf
cp -pv IPAexfont00401/ipaexm.ttf /usr/share/fonts/ipaexfont-mincho/ipaexm.ttf
rm -rf IPAexfont00401*

gem install bundler
wget https://www.redmine.org/releases/redmine-4.1.1.tar.gz
tar xzvf redmine-4.1.1.tar.gz
mkdir -p /var/redmine
cp -pr redmine-4.1.1 /var/redmine/
cd /var/redmine/redmine-4.1.1/
sh setup-database.sh
sh setup-configuration.sh

bundle install --without development test --path vendor/bundle
bundle install --without development test rmagick
bundle install --without development test mysql2
bundle exec rake generate_secret_token
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production REDMINE_LANG=ja bundle exec rake redmine:load_default_data

useradd redmine
mkdir -p tmp tmp/pdf public/plugin_assets
chown -R redmine:redmine files log tmp public
chmod -R 755 files log tmp public

bundle exec rails server webrick -e production
