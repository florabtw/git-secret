#!/bin/bash

set -ex

USERNAME=ncpierson
IMAGE=git-secret

docker build                 \
  --no-cache                 \
  -t $USERNAME/$IMAGE:latest \
  .
