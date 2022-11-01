# We're running dnf update so this upgrades to the latest version of Rocky
FROM quay.io/rockylinux/rockylinux:8.5
USER 0

RUN dnf update -y
RUN dnf install -y python3 python3-devel git java-11-openjdk-devel
RUN dnf group install -y "Development Tools"

# Create necessary dirs
RUN mkdir -p $HOME/.cache $HOME/.bazel $HOME/.config $HOME/bin

ENV HOME /root

RUN mkdir -p "$HOME/bin"

RUN curl -o $HOME/bazel.sh -L https://github.com/bazelbuild/bazel/releases/download/5.0.0/bazel-5.0.0-installer-linux-x86_64.sh
RUN bash $HOME/bazel.sh --user && rm $HOME/bazel.sh

ADD get_arch /get_arch
ADD fetch_helm /fetch_helm
ADD fetch_kubectl /fetch_kubectl
ADD fetch_aws /fetch_aws
RUN /fetch_helm
RUN /fetch_kubectl
RUN /fetch_aws
RUN rm /fetch_helm /get_arch /fetch_kubectl /fetch_aws

# PATH configuration
ENV PATH "$PATH:$HOME/bin"

RUN bazel version
