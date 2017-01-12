# Docker volume test
## Mount a data volume without specifying volume name
Run:
```shell
$ docker run -it --name beatles -v /members centos:7
```
This command will create and run a container named “beatles”. Inside the running container a directory “/members” will be created. 

Inspection of container gives:
```json
 "Mounts": [
            {
                "Name": "a24edb63b329d30244deafb6036488231f5dd60c8f2...7c",
                "Source": "/var/lib/docker/volumes/a24edb63b...e57c/_data",
                "Destination": "/members",
                "Driver": "local",
                "Mode": "",
                "RW": true,
                "Propagation": ""
            }
        ],
```
“Source”-directory is located on the docker host machine  
“Destination”-directory is located inside the running container

### Persistence test
1. Run/Start container 
2. Login to the container and create a file in directory "/members". Name the file john.txt and add text “John Lennon” to it.
3. Stop container
4. Start container
5. Login to the container
6. The directory “/members" in the container is still there as is the file “john.txt”. The host directory "/var/lib/docker/volumes/a24edb63b...e57c/_data" also is still there, and it contains the file “john.txt”.

If I delete the container and again run:
```shell
$ docker run -it --name beatles -v /members centos:7
```
The directory “/member” is created in the container and is mapped to an new unnamed data volume on the host. There is no file “john.txt” in the the data volume on the host and neither in the "/member" directory in the container. The directory “/members” and the file “john.txt”  still exists in a “dangling” volume on the host.

#### Conclusion
To persist changes done to the container we can map a data volume (unnamed) on the host to a directory in the container, and changes made to that directory will persist between container stops and starts. They will no persist if the container is deleted.

***

## Mount a named data volume
The name of the volume in the example above is long and hard to recognize. 
If you instead run:
```shell
$ docker run -it --name beatles -v members:/members centos:7
```
where host-dir "members" has no leading slash (/) the volume on the host will reside amongst the other “anonymous” docker volumes, and it will have the name “members”. Quote from docker documentation: *“[...] Docker creates a named volume by that name”*

Inspection of container gives:
```json
"Mounts": [
    {
        "Name": "members",
        "Source": "/var/lib/docker/volumes/members/_data",
        "Destination": "/members",
        "Driver": "local",
        "Mode": "z",
        "RW": true,
        "Propagation": "rprivate"
    }
],
```
“Source”-directory is located on the docker host machine and has been given the name "members"
“Destination”-directory is located inside the running container

### Persistence test
1. Run/Start container 
2. Login to the container and create a file in directory "/members". Name the file john.txt and add text “John Lennon” to it.
3. Stop container
4. Start container
5. Login to the container
6. The directory “/members" in the container is still there as is the file “john.txt”. The mounted host directory “/var/lib/docker/volumes/members/_data” also is still there, as is the file “john.txt”

If I delete the container and again run
```shell
$ docker run -it --name beatles -v members:/members centos:7
```
The directory “/member” with the file “john.txt” is still there, both on the host and in the container.

#### Conclusion
To persist changes done to the container we can map a named volume on the host to a directory in the container, and changes made to that directory will persist between container stops, starts and also deletions.

## Mount a host directory as a data volume
You can also mount a specific directory on the host to a directory in the container
Run:
```shell
$ docker run -it --name beatles -v ${PWD}/members:/members centos:7
```
Inspection of container gives:
```json
"Mounts": [
    {
        "Source": "/usr/local/src/docker-images/beatles/members",
        "Destination": "/members",
        "Mode": "",
        "RW": true,
        "Propagation": "private"
    }
]
```
The same as in the example “Mount a host directory as a data volume” is true in this case, stopping, deleting and running/starting the container will result in the directory “/members” and the file “john.txt still being there, both on the host and in the container.
