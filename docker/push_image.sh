#! /bin/bash

SOURCE_IMAGE_FULLNAME=us-docker.pkg.dev/mxczkevm/images/raiko:latest

# Set image name
IMAGE_NAME=us-docker.pkg.dev/mxczkevm/images/raiko
if [ "_$1" == "_" ]; then
    IMAGE_TAG="latest"
elif [ "_$1" == "_moonchain" ]; then
    IMAGE_TAG="latest"
elif [ "_$1" == "_main" ]; then
    IMAGE_TAG="latest"
else
    IMAGE_TAG=`echo "$1" | sed 's/\//-/g'`
fi
IMAGE_FULLNAME="${IMAGE_NAME}:${IMAGE_TAG}"

if [ "${SOURCE_IMAGE_FULLNAME}" != "${IMAGE_FULLNAME}" ]; then
    docker image tag ${SOURCE_IMAGE_FULLNAME} ${IMAGE_FULLNAME}
fi

docker push ${IMAGE_FULLNAME}
