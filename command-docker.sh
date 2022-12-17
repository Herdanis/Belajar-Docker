# Docker List Image
docker image ls

# pull image from docker hub
docker image pull <image_name>:<tag>

# delete or remove docker image
docker image rm <image_name>:<tag>

# docker list container all include deactive container
docker container ls -a
docker container ls

# docker create container with name
docker container create --name <container_name> <image_name>:<tag>

# docker start container
docker container start <container_name>

# docker stop container
docker container stop <container_name>

# docker delete/remove container
docker container rm <container_name>

# docker container status in realtime
docker container stats

# create container with resouce limit
docker container create --name <container_name> --memory 100m --cpus 0.5 --publish <host_port>:<container_port> <image_name>:<tag>

# docker execute into container
docker container exec -i -t <container_name> /bin/bash

# run command in the docker and after command done automatically remove the container
docker run --rm -it -v $(pwd):</path/to/mount> <image_name> <...command>

# create container with port publish
docker container create --name <container_name> --publish <host_port>:<container_port> <image_name>:<tag>

# docker create docker volume
docker volume create <volume_name>

# docker delete/remove docker volume
docker volume rm mongovolume

# create container with docker volume
docker container create --name <volume_name> --publish <host_port>:<container_port> --mount "type=volume,source=<volume_name>,destination=<path/to/mount>" <image_name>:<tag>

# create container with binding volume to host (bind mount)
docker container create --name <volume_name> --publish <host_port>:<container_port> --mount "type=bind,source=<path/to/mount/host>,destination=<path/to/mount/container>" <image_name>:<tag>

# create container with environment 
docker container create --name <volume_name> --publish <host_port>:<container_port> --env <key>=<value> --env <key>=<value> <image_name>:<tag>

# check container logs
docker container logs <container_name>

# check container logs realtime 
docker container logs -f <container_name>

# docker create container networks 
docker network create --driver bridge <network_name>

# create container with networks container 
docker container create --name <container_name> --network <network_name> <image_name>:<tag>

# disconnect the container from networks
docker network disconnect <network_name> <container_name>

# conneting the container to networks
docker network connect <network_name> <container_name>

