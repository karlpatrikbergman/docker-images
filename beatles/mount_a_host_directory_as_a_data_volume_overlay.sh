#!/bin/bash - 

# MOUNT A HOST DIRECTORY AS A DATA VOLUME WHEN DIRECTORY WITH THE SAME NAME EXISTS 
# IN CONTAINER
# https://docs.docker.com/engine/tutorials/dockervolumes/

# The Dockerfile has an instruction that creates a directory in the container
# with the same name as the one on the host.
#
# This is to test how the overlay work. 
# Note that you have to build an image from Dockerfile first, and name it beatles_img

# Syntax:
# docker run -v /Users/<path>:/<container path> .

#Un-comment row below to run example:
docker run -it --name beatles -v ${PWD}/members:/members beatles_image /bin/bash

# After running this command /members/john.txt that is created in the Dockerfile
# is not visible when entering the container.
#
# Quote from docs.docker.com:
# "If the path /webapp already exists inside the container’s image, the /src/webapp 
#  mount overlays but does not remove the pre-existing content. Once the mount is 
#  removed, the content is accessible again. This is consistent with the expected 
#  behavior of the mount command."
