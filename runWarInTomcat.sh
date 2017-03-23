#!/bin/bash

# Run existing tomcat only docker container.  Webapps 
# will be found in current directory.  Logs will go to
# new local directory with script process id.  The name
# will be the tomcat tag appended with script process id.
# eg a log directory named logs.2323 and container id of
# 7.jre7.2323

# To get into the shell in the container run:
#  "docker exec -it <container name> bash"

set -x

# Use this tomcat version.
TOMCAT_TAG="7-jre7"
# expose these ports by default
PORTS=" -p 8080:8080 -p 8090:8090 "
# expose - local webapps and logs
#        - log 

WAR_DIR=" -v $(pwd):/usr/local/tomcat/webapps "
LOG_DIR=" -v $(pwd)/logs.$$:/usr/local/tomcat/logs "
VOLUMES=" $WAR_DIR $LOG_DIR "

# Give explicit name so don't have to look it up later.
NAME=${TOMCAT_TAG}.$$
IMAGE_NAME=" --name ${NAME} "

# run it.
echo "Running docker container with name: ${TOMCAT_TAG}.$$"
docker run ${PORTS} ${VOLUMES} ${IMAGE_NAME} tomcat:${TOMCAT_TAG} 
#end
