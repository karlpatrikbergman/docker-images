# Docker volume test
Mount a data volume without specifying volume name
Run:
$ docker run -it --name beatles -v /members centos:7
This command will create and run a container named “beatles”. Inside the running container a directory called “members” will be created. 

Inspection of container gives:
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

“Source”-directory is located on the docker host machine
“Destination”-directory is located inside the running container

Persistence test:
Start container
Create file /members/john.txt containing text “John Lennon”
Stop container
Start container
Login to the container
The directory “/members and file in it “john.txt” that was added before is still left within the container. The host directory “"/var/lib/docker/volumes/a24edb63b...e57c/_data” also is still there, and it contains the file “john.txt”

If I delete the container and again run:
$ docker run -it --name beatles -v /members centos:7
The directory “member” is created in the container and is mapped to an new unnamed data volume on the host. There is no file “john.txt” in it and neither in the member directory in the container. The directory “members” and the file “john.txt”  still exists in a “dangling” volume on the host.

Conclusion: To persist changes done to the container we can map a data volume (unnamed) on the host to a directory in the container, and changes made to that directory will persist between container stops and starts. They will no persist if the container is deleted.


Mount a named data volume
The name of the volume in the example above is long and hard to recognize. 
If you instead run:
$ docker run -it --name beatles -v members:/members centos:7
where host-dir has no leading slash (/) the volume on the host will reside amongst the other “anonymous” docker volumes, and it will have the name “members”. Quote from docker documentation: “[...] Docker creates a named volume by that name”

Inspection of container gives:
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

The name of the volume is “members”.

Persistence test:
Start container
Create file /members/john.txt containing text “John Lennon”
Stop container
Start container
Login to the container
The directory “/members and file in it “john.txt” that was added before is still left in the container. The host directory “/var/lib/docker/volumes/members/_data” also is still there, as is the file “john.txt”

If I delete the container and again run
$ docker run -it --name beatles -v members:/members centos:7
The directory “member” with the file “john.txt” is still there, both on the host and in the container.

Conclusion: To persist changes done to the container we can map a named volume on the host to a directory in the container, and changes made to that directory will persist between container stops, starts and also deletions.
Mount a host directory as a data volume
You can also mount a specific directory on the host to a directory in the container
Run:
$ docker run -it --name beatles -v ${PWD}/members:/members centos:7
Inspection of container gives:
"Mounts": [
    {
        "Source": "/usr/local/src/docker-images/beatles/members",
        "Destination": "/members",
        "Mode": "",
        "RW": true,
        "Propagation": "private"
    }
]
The same as in the example “Mount a host directory as a data volume” is true in this case, deleting and starting the container will result in the directory “members” and the file “john.txt still being there, both on the host and in the container.

The container-dir must always be an absolute path such as /src/docs. The host-dir can either be an absolute path or a name value. If you supply an absolute path for the host-dir, Docker bind-mounts to the path you specify. If you supply a name, Docker creates a named volume by that name.




