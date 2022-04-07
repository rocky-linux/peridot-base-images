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
    rpm-sign \
    sudo

RUN ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""
RUN dnf clean all
RUN rm -rf /etc/yum.repos.d/*.repo
RUN useradd mock
RUN chown mock:mock /etc/yum.conf && chown -R mock:mock /etc/dnf && chown -R mock:mock /etc/rpm && chown -R mock:mock /etc/yum.repos.d
RUN echo "mock ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ADD --chown=mock:mock yum-sudo /usr/bin/yum-sudo
RUN chmod +x /usr/bin/yum-sudo

USER mock
