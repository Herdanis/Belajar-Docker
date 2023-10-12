<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="https://avatars.githubusercontent.com/u/45662503?v=4g" alt="Project logo"></a>
</p>

<h3 align="center">Dockerfile</h3>

<div align="center">

[![Status](https://img.shields.io/badge/status-active-success.svg)]()
[![GitHub Issues](https://img.shields.io/github/issues/Herdanis/Belajar-Docker)](https://github.com/Herdanis/Belajar-Docker)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/Herdanis/Belajar-Docker)](https://github.com/Herdanis/Belajar-Docker/pulls)

</div>

---

## 📝 Table of Contents

- [List Command](#command)
- [ENTRYPOINT vs CMD](#entrycmd)
- [ADD vs COPY](#addcopy)

## 📟 List Command <a name="command"></a>

Build Command

```
# build sebuah docker image dari Dockerfile
docker build -t <USERNAME>/<NAMA_IMAGE>:<TAG> .
docker build -t <USERNAME>/<NAMA_IMAGE>:<TAG> <NAMA_DOCKERFILE>

# build sebuah image tanpa cache dan menampilak progress
docker build -t <USERNAME>/<NAMA_IMAGE>:<TAG> --progress=plain --no-cache
```

Tag Command

```
docker tag <NAMA_IMAGE_LAMA> <USERNAME_BARU>/<NAMA_IMAGE_BARU>:<TAG_BARU>
```

## 🔬 ENTRYPOINT vs CMD <a name="entrycmd"></a>

<h4>Default Behavior:</h4>

- <b>CMD</b>
  Menyediakan argumen default untuk perintah `ENTRYPOINT`, atau menentukan perintah yang akan dijalankan jika `ENTRYPOINT`tidak ditentukan.

- <b>ENTRYPOINT</b>
  Mendefinisikan perintah dasar yang akan selalu dijalankan saat kontainer dimulai. Jika sebuah perintah diberikan selama invokasi `docker run`, perintah tersebut akan menggantikan instruksi `CMD`, tetapi akan dianggap sebagai argumen untuk `ENTRYPOINT`.

Detail:

1. Jika `ENTRYPOINT` didefinisikan tetapi `CMD` tidak:
   Ketika kita menjalankan kontainer dari image tersebut, hanya perintah ENTRYPOINT yang dijalankan. Tetapi jika kita memberikan perintah saat invokasi `docker run`, perintah tersebut menjadi argumen untuk ENTRYPOINT.

1. Jika `ENTRYPOINT` dan `CMD` keduanya didefinisikan:
   `ENTRYPOINT` menentukan executable (atau perintah utama), dan `CMD` menyediakan argumen default. Jika kita memberikan perintah saat invokasi `docker run`, perintah tersebut akan menggantikan argumen `CMD`, tetapi perintah `ENTRYPOINT` tetap dijalankan.

Contoh dockerfile:

```
ENTRYPOINT ["echo"]
CMD ["Halo, Dunia!"]
```

- Dari Contoh di atas menjalankan `docker run` <nama_image> akan menghasilkan output `Halo, Dunia!` karena kombinasi dari `ENTRYPOINT` dan `CMD`.
- Namun, jika kita menjalankan: `docker run <nama_image> Selamat Tinggal`, maka hasil outputnya adalah `Selamat Tinggal`. Di sini, "Selamat Tinggal" menggantikan default `CMD ("Halo, Dunia!")`, tetapi tetap menggunakan `ENTRYPOINT (echo)`.

<h4>Overriding Behavior:</h4>

- <b>CMD</b>
  Jika Anda menentukan `command` di akhir docker run, maka `command` tersebut akan menggantikan instruksi CMD dalam Dockerfile.
- <b>ENTRYPOINT</b>
  `Command` `ENTRYPOINT` akan selalu dijalankan kecuali jika digantikan menggunakan docker run dengan flag --entrypoint.

<h4>Combination:</h4>
Kita dapat menggunakan `ENTRYPOINT` bersama dengan `CMD`. Ketika digunakan bersama, nilai `CMD` akan diteruskan sebagai argumen default ke `ENTRYPOINT`. Seperti contoh di bagian <b>Default Behavior</b>

<h4>Form:</h4>

Keduanya bisa didefinisikan dalam bentuk shell atau bentuk exec.

- Shell Form: `CMD "command param1 param2"`
- Exec Form: `CMD ["command", "param1", "param2"]`

<h4>Kasus Penggunaan:</h4>

- <b>CMD</b>: Ketika kita ingin menyediakan `command` default dan/atau argumen yang dapat dengan mudah digantikan oleh pengguna. Cocok untuk kasus ketika gambar dapat dijalankan seperti adanya atau dengan argumen yang ditentukan oleh pengguna.
- <b>ENTRYPOINT</b>: Ketika kita ingin kontainer selalu berjalan sebagai executable tertentu (dengan parameter default opsional). Ini cocok untuk kasus ketika kontainer dimaksudkan untuk dianggap sebagai aplikasi atau service tertentu.

<!-- TODO: Comparasi perbedaan ADD dan COPY -->
