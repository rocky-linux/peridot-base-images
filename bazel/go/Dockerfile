FROM quay.io/rockylinux/rockylinux:8.5
USER 0

ADD get_arch /get_arch

RUN curl -L "https://github.com/golang-migrate/migrate/releases/download/v4.14.1/migrate.linux-$(/get_arch).tar.gz" | tar xvz
RUN mv "./migrate.linux-$(/get_arch)" /usr/bin/migrate
RUN dnf update -y && dnf install -y vim-common && dnf clean all

USER 1000

WORKDIR /home/app
