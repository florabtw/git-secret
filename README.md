# Git Secret (Docker Image)

This repository tracks the Dockerfile and build/release scripts needed to
maintain a docker image for [git-secret](http://git-secret.io/).

I needed this primarily because I wanted to use `git secret` on a Travis CI
build, but I could not install the gpg version I needed (2.2+) to maintain
consistency with my personal development environments.

# Info

Latest image contains:

- Ubuntu: 20.10
- gpg: 2.2.20
- git-secret: 0.3.2

Check [releases](https://github.com/ncpierson/git-secret/releases) for info on what versions are included in each docker image.

# Usage

To pull this container:

```
docker pull ncpierson/git-secret
```

To use a git secret command:

```bash
command=`cat <<EOF
gpg --batch --import secret.gpg && \
  git secret reveal -p $PASSWORD
EOF
`

docker run             \
  -v `pwd`:`pwd`       \
  -w `pwd`             \
  ncpierson/git-secret \
  bash -c "$command"
```


For instance, this would reveal secrets in your current working directory,
provided you have a `secret.gpg` file and `$PASSWORD` is the password for it.

Alternatively you can add `git-secret-reveal-docker.sh` and `git-secret-hide-docker.sh` 
to your repo which automates extracting your key the first time you run it. 


# Contributing

Built by:

- [Nick Pierson](https://nick.exposed)
- [Simon Massey](https://github.com/simbo1905)

Pull requests welcome!
