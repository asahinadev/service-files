#!/bin/sh

DIR=${DIR:=/var/redmine/current}

cat << EOS > /usr/lib/systemd/system/redmine.service
[Unit]
Description=Redmine erver
After=mysqld.service

[Service]
WorkingDirectory=${DIR}
Environment=RAILS_ENV=production

ExecStart=/usr/local/bin/bundle exec rails server webrick -e production

[Install]
WantedBy=multi-user.target
EOS
