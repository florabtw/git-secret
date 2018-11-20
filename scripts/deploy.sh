#!/bin/bash

USERNAME=ncpierson
IMAGE=git-secret
VERSION=`cat VERSION`

./scripts/build.sh

docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$VERSION
docker push $USERNAME/$IMAGE:latest
docker push $USERNAME/$IMAGE:$VERSION
