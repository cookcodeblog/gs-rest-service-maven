#!/usr/bin/env bash

set -e

mkdir -p docker
cp Dockerfile ./docker
cp target/*.jar ./docker
cd ./docker

IMG_NAME=$1
IMG_VERSION=$2
docker build -t ${IMG_NAME}:${IMG_VERSION} .
