FROM quay.io/centos/centos:stream9

RUN dnf update -y && dnf install -y epel-release

RUN dnf install -y \
    bash \
    bzip2 \
    cpio \
    diffutils \
    findutils \
    gawk \
    gcc \
    gcc-c++ \
    git \
    grep \
    gzip \
    info \
    make \
    patch \
    python3 \
    redhat-rpm-config \
    rpm-build \
    scl-utils-build \
    sed \
    shadow-utils \
    tar \
    unzip \
    util-linux \
    which \
    xz \
    dnf-plugins-core \
    createrepo_c \
    rpm-sign \
    sudo \
    mock

RUN ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""
RUN dnf clean all
RUN rm -rf /etc/yum.repos.d/*.repo
RUN useradd -o -d /var/peridot -u 1002 peridotbuilder && usermod -a -G mock peridotbuilder

ENV USER=1002
USER 1002
