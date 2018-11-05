#! /bin/bash
# Install puppet agent for Centos
sudo rpm -ivh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
sudo yum install puppet-agent -y
sudo service puppet start
