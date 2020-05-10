#!/bin/sh

DIR=${DIR:=/var/redmine/current}

cat << EOS > /usr/lib/systemd/system/redmine-unicorn.service
[Unit]
Description=Redmine Unicorn Server
After=mysqld

[Service]
WorkingDirectory=${DIR}
Environment=RAILS_ENV=production
SyslogIdentifier=redmine-unicorn
PIDFile=${DIR}/tmp/pids/unicorn.pid

ExecStart=/usr/local/bin/bundle exec "unicorn_rails -c config/unicorn.rb -E production" 
ExecStop=/usr/bin/kill -QUIT $MAINPID
ExecReload=/bin/kill   -USR2 $MAINPID

[Install]
WantedBy=multi-user.target
EOS
