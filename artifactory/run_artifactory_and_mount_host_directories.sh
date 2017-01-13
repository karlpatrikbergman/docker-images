#!/usr/bin/env bash
#
# RUN ARTIFACTYORY AS DOCKER CONTAINER MOUNTING HOST DIRECTORIES
#   docker mount volume syntax:
#   docker run -v /<absolute-path-on-host>:/<container-path> ...

ARTIFACTORY_HOME="/var/opt/jfrog/artifactory" # Path within container
ARTIFACTORY_DOCKER_IMAGE="jfrog-docker-reg2.bintray.io/jfrog/artifactory-registry:latest"

docker run -d \
    --name artifactory \
    -p 80:80 -p 8081:8081 -p 443:443 -p 5000-5002:5000-5002 \
    -v ${PWD}/data:${ARTIFACTORY_HOME}/data \
    -v ${PWD}/logs:${ARTIFACTORY_HOME}/logs \
    -v ${PWD}/backup:${ARTIFACTORY_HOME}/backup \
    -v ${PWD}/etc/:${ARTIFACTORY_HOME}/etc \
    ${ARTIFACTORY_DOCKER_IMAGE}
