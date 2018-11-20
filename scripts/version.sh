#!/bin/bash

set -e

USERNAME=ncpierson
IMAGE=git-secret

git pull

version=`cat VERSION`
echo "Curent version: $version"
read -p "New version: " version

echo "Using version: $version"

git add VERSION
git commit -m "v$VERSION"

git push
git push --tags
