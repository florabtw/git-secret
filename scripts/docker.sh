
#!/bin/bash

set -e

USERNAME=ncpierson
IMAGE=git-secret
VERSION=`cat .version`

# Begin Functions

build () {
  docker build                 \
    --no-cache                 \
    -t $USERNAME/$IMAGE:latest \
    .

}

push () {
  docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$VERSION

  docker push $USERNAME/$IMAGE:latest
  docker push $USERNAME/$IMAGE:$VERSION
}

# Begin Script

COMMAND=${1}

case "$COMMAND" in
  build) build $@;;
  deploy)
    build
    push
    ;;
  push) push $@;;
esac
