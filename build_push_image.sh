#!/bin/bash

# build file dockerfile
docker build -t item-app:v1 .

# melihat daftar image di lokal
docker images

# mengubah nama image agar sesuai dengan format github package container
docker tag item-app:v1 ghcr.io/mollshf/item-app:v1

# melakukan login github package container menggunakan token yang dibuat pada akun github
echo $CR_PAT | docker login ghcr.io -u mollshf --password-stdin

# Push image ke github package contianer
docker push ghcr.io/mollshf/item-app:v1