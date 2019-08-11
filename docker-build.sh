#!/bin/sh

# ./docker-build.sh <HARBOR_USERNAME> <HARBOR_PASSWORD> <HARBOR_REGISTRY_URL> <HABOR_PROJECT>
#
# Example: ./docker-build.sh ${HARBOR_USERNAME} ${HARBOR_PASSWORD} 192.168.87.151:10090 demo

set -e

. ./target/maven-archiver/pom.properties

mkdir -p docker
cp Dockerfile ./docker
cp target/*.jar ./docker
cd ./docker

JAR_NAME=${artifactId}
JAR_FILE=${JAR_NAME}-*.jar

IMG_NAME=${JAR_NAME}
IMG_VERSION=${version}
docker build -t ${IMG_NAME}:${IMG_VERSION} --build-arg jar_file=${JAR_FILE} .

# Push image to image repository
HARBOR_USERNAME="$1"
HARBOR_PASSWORD="$2"
HARBOR_REGISTRY_URL="$3"
HARBOR_PROJECT="$4"
NEW_IMAGE_NAME="${HARBOR_REGISTRY_URL}/${HARBOR_PROJECT}/${IMG_NAME}:${IMG_VERSION}"

docker login -u ${HARBOR_USERNAME} -p ${HARBOR_PASSWORD} ${HARBOR_REGISTRY_URL}

docker tag ${IMG_NAME}:${IMG_VERSION} ${NEW_IMAGE_NAME}
docker push ${NEW_IMAGE_NAME}

docker logout ${HARBOR_REGISTRY_URL}
