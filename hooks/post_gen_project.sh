#!/bin/bash

bundle install
bundle exec spring binstub --all
rails db:create db:migrate
rails generate cucumber:install
bash ./tests.sh
