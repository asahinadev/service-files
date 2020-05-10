#!/bin/sh

git clone https://github.com/dergachev/redmine_git_remote.git
chown redmine.redmine redmine_git_remote -R
bundle exec rake redmine:plugins:migrate RAILS_ENV=production
