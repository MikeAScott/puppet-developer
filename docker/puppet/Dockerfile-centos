FROM centos:centos7

RUN groupadd -r puppetdev && \
    useradd --no-log-init -r -g puppetdev -m puppetdev

RUN rpm -Uvh https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm && \
    yum -y update && \
    yum -y install puppetserver && \
    yum clean all && \
    rm -rf /var/cache/yum

USER puppetdev
