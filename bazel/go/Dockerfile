FROM rockylinux:9
USER 0

ADD get_arch /get_arch
ADD fetch_migrate /fetch_migrate

RUN /fetch_migrate
RUN rm /fetch_migrate /get_arch
RUN dnf update -y && dnf install -y vim-common && dnf clean all

USER 1000

WORKDIR /home/app
