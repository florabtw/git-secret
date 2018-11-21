#!/bin/bash

# One time export of the private key. 
if [ ! -f ~/gpg/secret.gpg ]; then
   # Read gpg ID:
   echo -n "No encrypted private found. Lets export it. Which ID (email) to export? "
   read ID 
   mkdir -p ~/gpg
   gpg --export-secret-keys $ID > ~/gpg/secret.gpg 
fi

# Read Password
echo -n Password: 
read -s PASSWORD 
echo

# Run Command
command="gpg --batch --import /gpg/secret.gpg && git secret reveal -p $PASSWORD"

docker run             \
  -v "$(dirname ~/gpg/secret.gpg):/gpg"   \
  -v `pwd`:`pwd`       \
  -w `pwd`             \
  ncpierson/git-secret \
  bash -c "$command"
