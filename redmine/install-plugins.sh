#!/bin/sh

git clone https://github.com/dergachev/redmine_git_remote.git
git clone https://github.com/haru/redmine_theme_changer.git
git clone https://github.com/tleish/redmine_editor_preview_tab.git
git clone https://github.com/suer/redmine_absolute_dates.git

chown redmine.redmine . -R
bundle exec rake redmine:plugins:migrate RAILS_ENV=production
systemctl restart redmine
