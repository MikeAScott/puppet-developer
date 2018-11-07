######################################################
# Install all tools for puppet development environment
######################################################
# Vagrant
choco install -y virtualbox
choco install -y vagrant
vagrant plugin install vagrant-hostmanager

# Atom editor
choco install -y atom
apm install language-puppet
gem install puppet-lint
apm install intentions
apm install busy-signal
apm install linter
apm install linter-ui-default
apm install linter-puppet-lint

# Cmder
choco install -y cmder
