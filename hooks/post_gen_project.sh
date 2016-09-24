#!/bin/bash

ask() {
    # http://djm.me/ask
    local prompt default REPLY

    while true; do

        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi

        # Ask the question (not using "read -p" as it uses stderr not stdout)
        echo -n "$1 [$prompt] "

        # Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
        read REPLY </dev/tty

        # Default?
        if [ -z "$REPLY" ]; then
            REPLY=$default
        fi

        # Check if the reply is valid
        case "$REPLY" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac

    done
}

# Credit: https://gist.github.com/davejamesmiller/1965569

CURRENT_DIR=`pwd`
bundle install && \
# bundle exec spring binstub --all && \
rails db:create && \
# rails g scaffold Role name:string
# rails g scaffold User name:string role:belongs_to
# rails g devise:views && \
# rails generate devise User -s && \
rails db:migrate && \
rails db:seed && \
osascript -e 'tell application "iTerm" to activate' \
          -e 'tell application "System Events" to tell process "iTerm" to keystroke "t" using command down' \
          -e "tell application \"System Events\" to tell process \"iTerm\" to keystroke \"cd $CURRENT_DIR && rails server\"" \
          -e 'tell application "System Events" to tell process "iTerm" to key code 52' \
          -e 'tell application "System Events" to tell process "iTerm" to key code 123 using command down' && \
bash ./tests.sh && \
git init && \
git checkout -b develop && \
git add -A && \
git commit -m "Initial {{cookiecutter.project_name}} project" &&
osascript -e 'tell application "Google Chrome Canary" to open location "http://localhost:3000"' && \
sleep 2
/usr/local/bin/mine .
