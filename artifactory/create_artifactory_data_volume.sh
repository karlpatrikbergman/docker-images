#!/usr/bin/env bash

ARTIFACTORY_DIR="/usr/local/src/docker-images/artifactory"
ARTIFACTORY_DOCKER_IMAGE="jfrog-docker-reg2.bintray.io/jfrog/artifactory-registry:latest"

docker create \
    -v "$ARTIFACTORY_DIR/data":/var/opt/jfrog/artifactory/data \
    -v "$ARTIFACTORY_DIR/logs":/var/opt/jfrog/artifactory/logs \
    -v "$ARTIFACTORY_DIR/backup":/var/opt/jfrog/artifactory/backup \
    -v "$ARTIFACTORY_DIR/etc":/var/opt/jfrog/artifactory/etc \
    --name artifactory-dv $ARTIFACTORY_DOCKER_IMAGE
