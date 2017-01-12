#!/bin/bash - 

# Mount data volume to directory inside container, witout giving it a name
# https://docs.docker.com/engine/tutorials/dockervolumes/

docker run -it --name beatles -v /members centos:7

# Example of resulting mounts (docker inspect beatles)
# "Mounts": [
#   {
#       "Name": "f8de214679474c3b8f31b5ba709e7e6b26df64fb15950b61afc3337e978f9612",
#       "Source": "/var/lib/docker/volumes/f8de214679474c3b8f31b5ba709e7e6b26df64fb15950b61afc3337e978f9612/_data",
#       "Destination": "/members",
#       "Driver": "local",
#       "Mode": "",
#       "RW": true,
#       "Propagation": ""
#   }
