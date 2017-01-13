#!/usr/bin/env bash
# RUN ARTIFACTORY AS DOCKER CONTAINER MOUNTING NAMED DATA VOLUMES
#   docker mount named volume syntax:
#   docker run -v <host-volume-name>:/<container-path>

ARTIFACTORY_HOME="/var/opt/jfrog/artifactory"
ARTIFACTORY_DOCKER_IMAGE="jfrog-docker-reg2.bintray.io/jfrog/artifactory-registry:latest"

docker run -d \
    --name artifactory \
    -p 80:80 -p 8081:8081 -p 443:443 -p 5000-5002:5000-5002 \
    -v data:${ARTIFACTORY_HOME}/data \
    -v logs:${ARTIFACTORY_HOME}/logs \
    -v backup:${ARTIFACTORY_HOME}/backup \
    -v etc:${ARTIFACTORY_HOME}/etc \
    ${ARTIFACTORY_DOCKER_IMAGE}
