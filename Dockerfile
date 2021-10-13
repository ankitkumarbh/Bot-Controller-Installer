# Download base image ubuntu 20.04
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Asia/Kolkata

RUN apt-get update && apt upgrade -y && apt-get install sudo -y

RUN apt-get install -y\
    coreutils \
    bash \
    bzip2 \
    curl \
    figlet \
    git \
    postgresql \
    postgresql-client \
    postgresql-server-dev-all \
    wget \
    python3 \
    python3-dev \
    python3-pip \
    zip \
    unrar \
    procps \
    p7zip-full \
    tree

RUN apt-get autoremove --purge

RUN pip3 install --upgrade pip setuptools 
RUN if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi 
RUN if [ ! -e /usr/bin/python ]; then ln -sf /usr/bin/python3 /usr/bin/python; fi 
RUN rm -r /root/.cache
RUN git clone https://github.com/ankitkumarbh/Bot-Controller-Installer /root/Bot-Controller-Installer
WORKDIR /root/Bot-Controller-Installer/
RUN pip3 install -r requirements.txt
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
CMD ["bash","start.sh"]
