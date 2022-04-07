FROM registry.opensuse.org/opensuse/leap-dnf:15.3

RUN dnf update -y && dnf install -y patterns-devel-base-devel_rpm_build createrepo_c dnf-plugins-core gcc-c++ git unzip sudo

RUN ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""
RUN dnf clean all
RUN rm -rf /etc/yum.repos.d/*.repo
RUN useradd mockbuild && groupadd mock && usermod -a -G mock mockbuild
RUN chown -R mockbuild:mock /etc/dnf && chown -R mockbuild:mock /etc/rpm && chown -R mockbuild:mock /etc/yum.repos.d
RUN echo "mockbuild ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ADD --chown=mockbuild:mock yum-sudo /usr/bin/yum-sudo
RUN chmod +x /usr/bin/yum-sudo

USER mockbuild
