FROM registry.opensuse.org/opensuse/leap-dnf:15.3

RUN dnf update -y && dnf install -y patterns-devel-base-devel_rpm_build createrepo_c dnf-plugins-core gcc-c++ git unzip

RUN ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""
RUN dnf clean all
RUN rm -rf /etc/yum.repos.d/*.repo
RUN useradd mock

USER mock
