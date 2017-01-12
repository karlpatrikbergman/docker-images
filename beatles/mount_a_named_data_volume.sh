#!/bin/bash - 

# Mount named volume to directory inside container
# https://docs.docker.com/engine/tutorials/dockervolumes/

# Syntax:
# docker run -v <name-of-volume>:/<container path> .

docker run -it --name beatles -v members:/members centos:7

# Example of resulting mounts (docker inspect beatles)
# "Mounts": [
#   {
#       "Name": "members",
#       "Source": "/var/lib/docker/volumes/members/_data",
#       "Destination": "/members",
#       "Driver": "local",
#       "Mode": "z",
#       "RW": true,
#       "Propagation": "rprivate"
#   }
