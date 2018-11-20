FROM ubuntu:18.04

RUN apt-get update -y

RUN apt-get install \
  git           \
  gnupg         \
  gawk          \
  wget          \
  -y

RUN echo "deb https://dl.bintray.com/sobolevn/deb git-secret main" | tee -a /etc/apt/sources.list

RUN wget -qO - https://api.bintray.com/users/sobolevn/keys/gpg/public.key | apt-key add -

RUN apt-get update -y

RUN apt-get install git-secret -y
