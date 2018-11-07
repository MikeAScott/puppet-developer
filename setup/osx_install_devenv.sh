#! /bin/bash
# Install vagrant on MAC using homebrew
brew update
# vagrant
brew cask install virtualbox
brew cask install vagrant
vagrant plugin install vagrant-hostmanager
# atom
brew cask install atom
apm install language-puppet
gem install puppet-lint
apm install intentions
apm install busy-signal
apm install linter
apm install linter-ui-default
apm install linter-puppet-lint
# tmux
brew install tmux
brew install coreutils
git clone https://github.com/arl/tmux-gitbar.git ~/.tmux-gitbar
cp -f setup/.tmux.conf ~/
gem install tmuxinator
