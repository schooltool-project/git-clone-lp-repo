ARG UBUNTU_VERSION=18.04
ARG USER_ID=1000
ARG GROUP_ID=1000

FROM ubuntu:${UBUNTU_VERSION}

ARG USER_ID
ARG GROUP_ID

SHELL ["sh", "-exc"]

RUN <<EOT
apt-get update -qy
apt-get install -qyy \
    -o APT::Install-Recommends=false \
    -o APT::Install-Suggests=false \
    ca-certificates \
    bzr \
    git \
    python-bzrlib \
    wget
EOT

ENV PATH=/app/bin:$PATH

RUN <<EOT
groupadd --gid ${GROUP_ID} -r app
useradd --uid ${USER_ID} --gid ${GROUP_ID} -r -d /app -N app
EOT

RUN <<EOT
mkdir -p /app/bin
chown -R app:app /app 
wget https://raw.github.com/felipec/git-remote-bzr/master/git-remote-bzr -O /app/bin/git-remote-bzr
chmod +x /app/bin/git-remote-bzr
EOT

USER app
WORKDIR /app
