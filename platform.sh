#!/bin/sh

if [ $# -ne 1 ]
then
    echo "Usage: $0 <build|up|stop|down|restart>"
    exit
fi

COMMAND=$1

. ./platform_env.sh

case $COMMAND in
    build)
        docker-compose build;;
    up)
        docker-compose pull && docker-compose up -d;;
    stop)
        docker-compose stop;;
    down)
        docker-compose down;;
    *) echo "Usage: $0 <build|up|down>";;
esac




