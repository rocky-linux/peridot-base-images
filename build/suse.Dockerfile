FROM registry.opensuse.org/opensuse/leap-dnf:15.3

RUN dnf update -y && dnf install -y patterns-devel-base-devel_rpm_build createrepo_c dnf-plugins-core gcc-c++ git unzip sudo

RUN ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""
RUN dnf clean all
RUN rm -rf /etc/yum.repos.d/*.repo
RUN useradd mock && groupadd mock && usermod -a -G mock mock
RUN chown -R mock:mock /etc/dnf && chown -R mock:mock /etc/rpm && chown -R mock:mock /etc/yum.repos.d
RUN echo "mock ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ADD --chown=mock:mock yum-sudo /usr/bin/yum-sudo
RUN chmod +x /usr/bin/yum-sudo

USER mock
