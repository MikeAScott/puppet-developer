######################################################
# Install all tools for puppet development environment
######################################################
# Vagrant
choco install -y virtualbox
choco install -y vagrant
C:\HashiCorp\Vagrant\bin\vagrant plugin install vagrant-hostmanager

# Atom editor
choco install -y ruby
C:\tools\ruby25\bin\gem install puppet-lint
choco install -y atom
~\AppData\Local\atom\bin\apm install --packages-file atom_packages

# Cmder
choco install -y cmder
