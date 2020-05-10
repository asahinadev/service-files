#!/bin/sh

DB_TYPE=${DB_TYPE:="mysql2"}
DB_USER=${DB_USER:="redmine"}
DB_PASS=${DB_PASS:="redmine"}
DB_NAME=${DB_NAME:="redmine"}
DB_HOST=${DB_HOST:="localhost"}

touch config/database.yml 
cat - << EOS > config/database.yml 
production:
  adapter:  "${DB_TYPE}"
  database: "${DB_NAME}"
  host:     "${DB_HOST}"
  username: "${DB_USER}"
  password: "${DB_PASS}"
  encoding: "utf8"
EOS
