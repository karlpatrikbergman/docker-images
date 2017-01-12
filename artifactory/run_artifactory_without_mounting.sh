#!/usr/bin/env bash
#
# RUN ARTIFACTORY AS DOCKER CONTAINER WITHOUT MOUNTING

ARTIFACTORY_DOCKER_IMAGE="jfrog-docker-reg2.bintray.io/jfrog/artifactory-registry:latest"

docker run -d \
    --name artifactory \
    -p 80:80 -p 8081:8081 -p 443:443 -p 5000-5002:5000-5002 \
    ${ARTIFACTORY_DOCKER_IMAGE}
