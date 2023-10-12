<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="https://avatars.githubusercontent.com/u/45662503?v=4g" alt="Project logo"></a>
</p>

<h3 align="center">Belajar Docker</h3>

<div align="center">

[![Status](https://img.shields.io/badge/status-active-success.svg)]()
[![GitHub Issues](https://img.shields.io/github/issues/Herdanis/Belajar-Docker)](https://github.com/Herdanis/Belajar-Docker)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/Herdanis/Belajar-Docker)](https://github.com/Herdanis/Belajar-Docker/pulls)

</div>

---

## 📝 Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [List Command](#command)
- [Addon](#addon)
- [Minikube](#minikube)
- [Authors](#authors)
- [Acknowledgements](#acknowledgement)

## 🧐 About <a name = "about"></a>

Ini adalah project untuk belajar bareng dan pengingat untuk diri saya sendiri tentang DevOps Engineer, Di repo ini mempelajari materi tentang Docker dan command nya.

## 🏁 Getting Started <a name = "getting_started"></a>

Sebelum memulai pastikan sudah menginstall docker desktop dan docker compose sudah bisa di jalankan

## 📟 List Command <a name="command"></a>

Run Command

```
# menjalankan container (--rm otomatis terhapus jika sudah selesai)
docker run --name <NAMA_CONTAINER> <NAMA_IMAGE>

# menjalankan command di dalam container setelah selesai container akan di hapus secara otomatis
docker run --rm -it -v $(pwd):</PATH/TO/MOUNT> <NAMA_IMAGE> <...COMMAND>

```

Image Command

```
# menampilak list image di local
docker image ls
docker image ls -a

# pull image dari image repository
# jika tidak menuliskan tag akan mendownload versi latest
docker image pull <NAMA_IMAGE>:<TAG>

# delete image dari local
docker image rm <NAMA_IMAGE>

# delete image yg tidak di gunakan
# minimal tidak digunakan oleh 1 container
docker image prune

# melihat detail dari image
docker image inspect <NAMA_IMAGE>

# mengupload/push image ke docker repository
docker image push <NAMA_IMAGE>
```

Network Command

```
# membuat network dengan driver bridge
docker network create --driver bridge <NAMA_NETWORK>

# memutuskan jaringan dengan container
docker network disconnect <NAMA_NETWORK> <NAMA_CONTAINER>

# menyambungakan jaringan dengan container
docker network connect <NAMA_NETWORK> <NAMA_CONTAINER>
```

Volume Command

```
# membuat volume
docker volume create <NAMA_VOLUME>

# hapus volume
docker volume rm <NAMA_VOLUME>
```

Container Command

```
# menampilan list container
docker container ls -a
docker container ls

# membuat conatainer
docker container <NAMA_IMAGE>:<TAG>

# membuat container dengan nama
docker container create --name <NAMA_CONTAINER> <NAMA_IMAGE>:<TAG>

# menjalankan container
docker container start <NAMA_CONTAINER>

# stop container
docker container stop <NAMA_CONTAINER>

# hapus container
docker container rm <NAMA_CONTAINER>

# cek statistik container
docker container stats
docker container stats <NAMA_CONTAINER>

# membuat container dengan mengexpose port
docker container create --name <NAMA_CONTAINER> --publish <HOST_PORT>:<CONTAINER_PORT> <NAMA_IMAGE>:<TAG>

# membuat container dengan resource limit
docker container create --name <NAMA_CONTAINER> --memory <MEMORY_LIMIT> --cpus <CPU_LIMIT> --publish <HOST_PORT>:<CONTAINER_PORT> <NAMA_IMAGE>:<TAG>

# melakukan execution ke dalam container
docker container exec -i -t <NAMA_CONTAINER> /bin/bash

# membuat container dengan volume
docker container create --name <NAMA_CONTAINER> --publish <HOST_PORT>:<CONTAINER_PORT>  --mount "type=volume,source=<NAMA_VOLUME>,destination=<PATH/TO/MOUNT>" <NAMA_IMAGE>:<TAG>

# membuat container dengan membinding host dan container
docker container create --name <NAMA_CONTAINER> --publish <HOST_PORT>:<CONTAINER_PORT> --mount "type=bind,source=<PATH/TO/MOUNT/ON/HOST>,destination=<PATH/TO/MOUNT/ON/CONTAINER>" <NAMA_IMAGE>:<TAG>

# membuat container dengan mencantumkan container environment
docker container create --name <NAMA_CONTAINER> --publish <HOST_PORT>:<CONTAINER_PORT> --env <KEY>=<VALUE> --env <KEY>=<VALUE> <NAMA_IMAGE>:<TAG>

# cek container logs
docker container logs <NAMA_CONTAINER>

# cek container logs realtime
docker container logs -f <NAMA_CONTAINER>

# membuat container dengan network
docker container create --name <NAMA_CONTAINER> --network <NAMA_NETWORKS> <NAMA_IMAGE>:<TAG>
```

## ✍️ Addon <a name = "addon"></a>

Backup dan Restore Volume

## ✍️ Authors <a name = "authors"></a>

- [@Herdanis](https://github.com/Herdanis) - Idea & Initial work

See also the list of [contributors](https://github.com/Herdanis/Belajar-Docker/graphs/contributors) who participated in this project.

## 🎉 Acknowledgements <a name = "acknowledgement"></a>

- [Docker Documantation](https://docs.docker.com/) - Official Documentation
- [Docker : Pemula sampai Mahir ](https://www.udemy.com/course/docker-pemula/) - Programmer Zaman Now
