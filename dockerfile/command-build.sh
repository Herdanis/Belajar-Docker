# Build docker image from dockerfile
docker build -t <username>/<image_name>:<tag> .

# Build docker image without cache and show the progress
docker build -t <username>/<image_name>:<tag> --progress=plain --no-cache

# Docker inspect the image to see the detail of image including enviroment
docker image inspect khannedy/command

# ARG Instruction
docker build -t khannedy/arg arg --build-arg app=pzn

# Docker Push
docker tag khannedy/multi registry.digitalocean.com/programmerzamannow/multi

docker --config /Users/khannedy/.docker-digital-ocean/ push registry.digitalocean.com/programmerzamannow/multi

docker --config /Users/khannedy/.docker-digital-ocean/ pull registry.digitalocean.com/programmerzamannow/multi
