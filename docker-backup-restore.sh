# example backup and restore docker from docker volume

## backup docker volume to archive ##

docker container stop mongovolume

docker container create --name nginxbackup --mount "type=bind,source=/Users/khannedy/Developments/YOUTUBE/belajar-docker-dasar/backup,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" nginx:latest

docker container start nginxbackup

docker container exec -i -t nginxbackup /bin/bash

tar cvf /backup/backup.tar.gz /data

docker container stop nginxbackup

docker container rm nginxbackup

docker container start mongovolume

docker image pull ubuntu:latest

docker container stop mongovolume

docker container run --rm --name ubuntubackup --mount "type=bind,source=/Users/khannedy/Developments/YOUTUBE/belajar-docker-dasar/backup,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" ubuntu:latest tar cvf /backup/backup-lagi.tar.gz /data

docker container start mongovolume

## docker restore volume ##
docker volume create mongorestore

docker container run --rm --name ubunturestore --mount "type=bind,source=/Users/khannedy/Developments/YOUTUBE/belajar-docker-dasar/backup,destination=/backup" --mount "type=volume,source=mongorestore,destination=/data" ubuntu:latest bash -c "cd /data && tar xvf /backup/backup.tar.gz --strip 1"

docker container create --name mongorestore --publish 27020:27017 --mount "type=volume,source=mongorestore,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=eko --env MONGO_INITDB_ROOT_PASSWORD=eko mongo:latest

docker container start mongorestore
