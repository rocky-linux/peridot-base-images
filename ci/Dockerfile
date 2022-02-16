FROM quay.io/rockylinux/rockylinux:8.5
USER 0

RUN dnf update -y
RUN dnf install -y python3 python3-devel git
RUN dnf group install -y "Development Tools"

# Create necessary dirs
RUN mkdir -p $HOME/.cache $HOME/.bazel $HOME/.config $HOME/bin

ENV HOME /root

RUN curl -o $HOME/bazel.sh -L https://github.com/bazelbuild/bazel/releases/download/5.0.0/bazel-5.0.0-installer-linux-x86_64.sh
RUN bash $HOME/bazel.sh --user && rm $HOME/bazel.sh

# PATH configuration
ENV PATH "$PATH:$HOME/bin"

RUN bazel version
