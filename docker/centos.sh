#!/bin/bash
usage () {
  echo -e "Usage $0 COMMAND" \
    '\ncommands:' \
    '\n  build       Build centos-agent docker image' \
    '\n  start       Start centos-agent docker container' \
    '\n  attach      Attach to centos-agent docker container with bash shell' \
    '\n  stop        Stop the centos-agent. N.B. this removes the container and data' \
    '\n  --help      Print usage'
}

build () {
  echo 'Building centos-agent image'
  docker build -t centos-agent ./centos
}

start () {
  echo 'Starting puppet-agent named centos'
#  rm -r code/modules/*
  docker run --name centos \
    --hostname centos \
    -d --rm \
    --cap-add SYS_ADMIN \
    centos-agent

  #docker exec puppet service puppetserver start
}

attach() {
  echo 'Attaching to centos-agent'
  docker exec -it centos /bin/bash
}

stop() {
  echo 'Stopping centos-agent'
  docker stop centos
}

if [ $# -eq 0 ]
  then usage
fi

for var in "$@"
do
  case $var in
    build|start|attach|stop)
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
