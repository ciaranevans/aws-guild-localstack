#!/bin/sh

docker-compose build
TMPDIR=/private$TMPDIR docker-compose run testing
if [[ $? == 0 ]]; then
    echo "Tests passed!"
    docker rm -f $(docker ps -aq)
else
    echo "Tests didn't pass!"
fi
