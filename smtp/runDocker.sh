#!/bin/bash
# Build, run (and remove) docker container to run python test smtp server.
# will run server at localhost:2025.  Can override port number on command line.
# e.g. ./runDocker.sh 6666

set -x
set -e

TAG=smtp-dev

SMTPPORT=${1:-2025}

docker build --build-arg SMTPPORT=${SMTPPORT} -t $TAG . \
    && docker run -it ${NET} ${V_LOG} ${V_CONFIG} --rm --name ${TAG}-run ${TAG}
#end
 
