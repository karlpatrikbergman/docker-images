#!/usr/bin/env bash
#
# RUN ARTIFACTORY AS DOCKER CONTAINER MOUNTING UNNAMED DATA VOLUMES
#   docker mount volume syntax:
#   docker run -v /<container-path> ...

ARTIFACTORY_HOME="/var/opt/jfrog/artifactory"
ARTIFACTORY_DOCKER_IMAGE="jfrog-docker-reg2.bintray.io/jfrog/artifactory-registry:latest"

docker run -d \
    --name artifactory \
    -p 80:80 -p 8081:8081 -p 443:443 -p 5000-5002:5000-5002 \
    -v ${ARTIFACTORY_HOME}/data \
    -v ${ARTIFACTORY_HOME}/logs \
    -v ${ARTIFACTORY_HOME}/backup \
    -v ${ARTIFACTORY_HOME}/etc \
    ${ARTIFACTORY_DOCKER_IMAGE}
