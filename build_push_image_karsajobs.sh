#!/bin/bash

# build file dockerfile
docker build -t karsajobs:latest .

# mengubah nama image agar sesuai dengan format github package container
docker tag karsajobs:latest ghcr.io/mollshf/karsajobs:latest

# melakukan login github package container menggunakan token yang dibuat pada akun github
echo $CR_PAT | docker login ghcr.io -u mollshf --password-stdin

# Push image ke github package contianer
docker push ghcr.io/mollshf/karsajobs:latest