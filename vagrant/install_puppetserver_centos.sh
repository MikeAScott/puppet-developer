#! /bin/bash

# Install puppetserver
sudo rpm -ivh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
sudo yum install puppetserver -y
Map puppet code and server config to local folders
sudo rm -rf /etc/puppetlabs/code
sudo ln -s /puppet_code /etc/puppetlabs/code
sudo rm -rf /etc/puppetlabs/puppetserver
sudo ln -s /puppet_puppetserver /etc/puppetlabs/puppetserver
# Configure autosigning
echo "*.example.com" | sudo tee /etc/puppetlabs/puppet/autosign.conf
# Reduce puppetserver JVM size to 512Mb
sudo sed -i 's/2g/512m/g' /etc/sysconfig/puppetserver
# Start puppetserver service
sudo service puppetserver start