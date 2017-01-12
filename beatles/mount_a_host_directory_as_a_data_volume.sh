#!/bin/bash - 

# MOUNT A HOST DIRECTORY AS A DATA VOLUME
# https://docs.docker.com/engine/tutorials/dockervolumes/

# Syntax:
# docker run -v <absolute-path-on-host>:/<container path> .

# Example: 
# docker run -v /some/absolut/path/foo:/foo

docker run -it --name beatles -v ${PWD}/members:/members centos:7

# Example of resulting mounts (docker inspect beatles)
# "Mounts": [
#   {
#       "Source": "/usr/local/src/docker-images/beatles/members",
#       "Destination": "/members",
#       "Mode": "",
#       "RW": true,
#       "Propagation": "private"
#   }
