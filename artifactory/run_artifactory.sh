#!/usr/bin/env bash
# docker mount volume syntax:
#   docker run -v /Users/<path>:/<container path> ...

ARTIFACTORY_HOME="/var/opt/jfrog/artifactory"
ARTIFACTORY_DOCKER_IMAGE="jfrog-docker-reg2.bintray.io/jfrog/artifactory-registry:latest"

docker run -d \
    --name artifactory \
    -p 80:80 -p 8081:8081 -p 443:443 -p 5000-5002:5000-5002 \
    -v ${PWD}/data:${ARTIFACTORY_HOME}/data \
    -v ${PWD}/logs:${ARTIFACTORY_HOME}/logs \
    -v ${PWD}/backup:${ARTIFACTORY_HOME}/backup \
    -v ${PWD}/etc/:${ARTIFACTORY_HOME}/etc \
    ${ARTIFACTORY_DOCKER_IMAGE}

#docker run -d \
#    --name artifactory \
#    -p 80:80 -p 8081:8081 -p 443:443 -p 5000-5002:5000-5002 \
#    --volumes-from artifactory-dv \
#    jfrog-docker-reg2.bintray.io/jfrog/artifactory-registry:latest

#docker run -d --name artifactory -p 80:80 -p 8081:8081 -p 443:443 -p 5000-5002:5000-5002 jfrog-docker-reg2.bintray.io/jfrog/artifactory-registry:latest


