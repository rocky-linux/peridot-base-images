FROM quay.io/rockylinux/rockylinux:8.5

RUN dnf update -y && dnf install -y \
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
    rpm-sign

RUN ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""
RUN dnf clean all
RUN rm -rf /etc/yum.repos.d/*.repo
