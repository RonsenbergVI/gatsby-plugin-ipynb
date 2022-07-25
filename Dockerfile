FROM node:12

# env variables
ENV USER=dev
ARG USER_HOME=/usr/local/$USER

# apt-get update and installs
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update -qy \
    && apt-get install \
        -y \
        --reinstall build-essential \
        --no-install-recommends \
    curl \
    make \
    gcc \
    git \
    openssh-server \
    nodejs \
    nano \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# check node and npm
RUN node -v && npm -v

WORKDIR "${USER_HOME}"

CMD ["/bin/bash"]
