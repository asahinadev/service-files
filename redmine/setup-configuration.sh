#!/bin/sh

PASSWORD=${PASSWORD:=""}

touch config/configuration.yml
cat - << EOS > config/configuration.yml
default:
  email_delivery:
    delivery_method: :smtp
    smtp_settings:
      enable_starttls_auto: true
      address: "smtp.sendgrid.net"
      port: 587
      domain:  "smtp.sendgrid.net"
      authentication: :plain
      user_name: "apikey"
      password:  "${PASSWORD}"
EOS
