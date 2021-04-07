FROM ubuntu:20.10

RUN apt-get update -y

RUN apt-get install       \
  git                     \
  gnupg=2.2.20-1ubuntu1.1 \
  gawk                    \
  wget                    \
  -y

RUN echo "deb https://dl.bintray.com/sobolevn/deb git-secret main" | tee -a /etc/apt/sources.list

RUN wget -qO - https://api.bintray.com/users/sobolevn/keys/gpg/public.key | apt-key add -

RUN apt-get update -y

RUN apt-get install git-secret=0.3.2 -y
