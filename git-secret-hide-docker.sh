#!/bin/bash

# Run Command
command="git secret hide"

docker run             \
  -v "$(dirname ~/gpg/secret.gpg):/gpg"   \
  -v `pwd`:`pwd`       \
  -w `pwd`             \
  ncpierson/git-secret \
  bash -c "$command"
