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
RUN useradd -o -d /var/peridot -u 1000 mockbuild && usermod -a -G mock mockbuild
RUN chown mockbuild:mock /etc/yum.conf && chown -R mockbuild:mock /etc/dnf && chown -R mockbuild:mock /etc/rpm && chown -R mockbuild:mock /etc/yum.repos.d
RUN echo "mockbuild ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ADD --chown=mockbuild:mock yum-sudo /usr/bin/yum-sudo
RUN chmod +x /usr/bin/yum-sudo

USER mockbuild
