FROM puppet/puppetserver-standalone
MAINTAINER Mike Scott "mike.scott2@hiscox.com"

# Install packages
# SSH to allow git ssh
# g++ an make to allow building of native gems
RUN apt-get update && \
    apt-get install -y ssh && \
    apt-get install -y g++ && \
    apt-get install -y make && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Enable SSH access to bitbucket
# Copy SSH keys - assumes that id_rsa key is added to bitbucket
# COPY keys/id_rsa /root/.ssh/id_rsa
# COPY keys/id_rsa.pub /root/.ssh/id_rsa.pub
# Add bitbucket to known hosts
# RUN mkdir -p /root/.ssh && \
#    ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts

#CMD ["service", "puppetserver", "start"]
