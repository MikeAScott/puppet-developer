#! /bin/bash
# Install puppet agent for Debian
wget https://apt.puppetlabs.com/puppet5-release-jessie.deb
sudo dpkg -i puppet5-release-jessie.deb
sudo apt-get update
sudo apt-get install puppet-agent -y
sudo /opt/puppetlabs/bin/puppet agent --enable
sudo service puppet start
