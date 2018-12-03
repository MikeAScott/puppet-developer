#!/bin/bash
usage () {
  echo -e "Usage $0 COMMAND" \
    '\ncommands:' \
    '\n  createkeys  Create eyaml keys for puppet-server' \
    '\n  build       Build puppet-server docker image' \
    '\n  start       Start puppet-server docker container' \
    '\n  attach      Attach to puppet-server docker container with bash shell' \
    '\n  stop        Stop the puppet-server. N.B. this removes the container and data' \
    '\n  --help      Print usage'
}

createkeys () {
  echo 'Creating eyaml keys for puppet'
  bundle exec eyaml createkeys
}

build () {
  echo 'Building puppet-server image'
  docker build -t puppet-server ./puppet
}

start () {
  echo 'Starting puppet-server named puppet'
#  rm -r code/modules/*
  docker run --name puppet \
    --hostname puppet \
    -d --rm \
    -v $PWD/code:/etc/puppetlabs/code/environments/production \
    -v $PWD/keys:/etc/puppetlabs/puppet/eyaml \
    -p 8140:8140 \
    puppet-server

  #docker exec puppet service puppetserver start

  echo -e \
    '\n  -------------------------------------------------' \
    '\n  When attached to the server for the first time:' \
    '\n    cd /etc/puppetlabs/code/environments/production' \
    '\n    r10k puppetfile install' \
    '\n    puppet agent -t' \
    '\n  -------------------------------------------------'
}

attach() {
  echo 'Attaching to puppet-server'
  docker exec -it puppet /bin/bash
}

stop() {
  echo 'Stopping puppet-server'
  docker stop puppet
}

if [ $# -eq 0 ]
  then usage
fi

for var in "$@"
do
  case $var in
    createkeys|build|start|attach|stop)
      $var
      ;;
    -h|--help|help)
      usage
      ;;
    *)
      usage
      ;;
  esac
done
