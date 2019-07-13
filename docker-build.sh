#!/usr/bin/env bash

set -e

mkdir -p docker
cp Dockerfile ./docker
cp target/*.jar ./docker
cd ./docker

JAR_NAME=gs-rest-service
JAR_VERSION=$1
JAR_FILE=${JAR_NAME}-${JAR_VERSION}.jar

IMG_NAME=${JAR_NAME}
IMG_VERSION=${JAR_VERSION}
docker build -t ${IMG_NAME}:${IMG_VERSION} --build-arg jar_file=${JAR_FILE} .

