#!/bin/sh

set -e

mkdir -p docker
cp Dockerfile ./docker
cp target/*.jar ./docker
cd ./docker

JAR_NAME=gs-rest-service
JAR_FILE=${JAR_NAME}-*.jar

IMG_NAME=${JAR_NAME}
IMG_VERSION=$1
docker build -t ${IMG_NAME}:${IMG_VERSION} --build-arg jar_file=${JAR_FILE} .

