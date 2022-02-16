FROM quay.io/peridot/build-base:v0.2.1

ENV ALKEMIST_VERSION="4.1.0-1"

RUN curl -o /tmp/alkemist-lfr.rpm -L "https://runsafesecurity.jfrog.io/ui/api/v1/download?repoKey=rpm-alkemist-lfr&path=8%2Falkemist-lfr-$ALKEMIST_VERSION.x86_64.rpm"
RUN curl -o /tmp/alkemist-lfr-liblfr.rpm -L "https://runsafesecurity.jfrog.io/ui/api/v1/download?repoKey=rpm-alkemist-lfr&path=8%2Falkemist-lfr-liblfr-$ALKEMIST_VERSION.x86_64.rpm"
RUN curl -o /tmp/alkemist-lfr-liblfr-dev.rpm -L "https://runsafesecurity.jfrog.io/ui/api/v1/download?repoKey=rpm-alkemist-lfr&path=8%2Falkemist-lfr-liblfr-dev-$ALKEMIST_VERSION.x86_64.rpm"
RUN curl -o /tmp/alkemist-lfr-licensechecker.rpm -L "https://runsafesecurity.jfrog.io/ui/api/v1/download?repoKey=rpm-alkemist-lfr&path=8%2Falkemist-lfr-licensechecker-$ALKEMIST_VERSION.x86_64.rpm"
RUN dnf install -y /tmp/alkemist*.rpm && dnf clean all && rm /tmp/alkemist*.rpm
