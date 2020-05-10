-- MySQL 8.0

CREATE DATABASE redmine CHARACTER SET utf8mb4;
CREATE USER 'redmine'@'localhost' IDENTIFIED WITH mysql_native_password;
ALTER USER 'redmine'@'localhost' identified BY 'redmine';
GRANT ALL ON redmine.* TO 'redmine'@'localhost' with grant option;
