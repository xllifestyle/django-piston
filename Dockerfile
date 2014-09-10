FROM ubuntu:13.10
MAINTAINER ISPM Developer Team "desenvolvimento@ispm.com.br"

ENV container docker
ENV INITRD No

# "basic" packages
RUN apt-get update -y && apt-get install -y  \
    wget                                     \
    python                                   \
    python-dev                               \
    python-virtualenv                        \
    python-software-properties               \
    software-properties-common               \
    curl                                     \
    mlocate                                  \
    && apt-get upgrade -y

ADD requirements.txt /tmp/requirements.txt

WORKDIR /tmp

RUN pip install -r requirements.txt

VOLUME ["/opt/app"]

WORKDIR /opt/app

# construir o container
# docker build -t marcio0/django-piston .

# conectar ao terminal do container
# docker run -i -v /home/vagrant/repos/django-piston:/opt/app --privileged=true -t marcio0/django-piston /bin/bash
