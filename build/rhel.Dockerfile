FROM rockylinux:9

ADD get_arch /get_arch

ENV TINI_VERSION v0.19.0
RUN curl -o /tini -L "https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-$(/get_arch)"
RUN chmod +x /tini

RUN rm -rf /etc/yum.repos.d/*.repo /get_arch
ADD epelkey.gpg /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-9
ADD rhel.repo /etc/yum.repos.d/rhel.repo

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
RUN chown peridotbuilder:mock /etc/yum.conf && chown -R peridotbuilder:mock /etc/dnf && chown -R peridotbuilder:mock /etc/rpm && chown -R peridotbuilder:mock /etc/yum.repos.d

ENV USER=1002
USER 1002

ENTRYPOINT ["/tini", "--"]
