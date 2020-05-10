-- MySQL 8.0

-- データベース作成
CREATE DATABASE redmine CHARACTER SET utf8mb4;

-- ユーザー作成
CREATE USER 'redmine'@'localhost' IDENTIFIED WITH mysql_native_password;

-- パスワード設定
ALTER USER 'redmine'@'localhost' identified BY 'redmine';

-- 権限追加
GRANT ALL ON redmine.* TO 'redmine'@'localhost' with grant option;
FLUSH PRIVILEGES;

-- END
