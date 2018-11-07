#! /bin/bash
cp -f setup/puppet-dev.yml ~/.config/tmuxinator/
tmux start \; new-session -d 'sleep 1'
tmuxinator puppet-dev