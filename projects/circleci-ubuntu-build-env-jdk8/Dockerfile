ARG BASE_IMAGE="cimg/openjdk"
ARG BASE_IMAGE_VERSION="8.0-node"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

SHELL ["/bin/bash", "-c"]

COPY tools/*.sh /usr/local/bin/

ARG REPO_HOST="debian.opennms.org"
ARG REPO_RELEASE="stable"
ARG REPO_KEY_URL="https://${REPO_HOST}/OPENNMS-GPG-KEY"
ARG DOCKER_COMPOSE_VERSION="2.11.1"

RUN sudo /usr/local/bin/ghost-apt-install.sh gnupg ca-certificates && \
    wget -qO- ${REPO_KEY_URL} | sudo apt-key add - && \
    echo "deb https://${REPO_HOST} ${REPO_RELEASE} main" | sudo tee /etc/apt/sources.list.d/opennms.list

ARG PACKAGES="\
  autoconf \
  automake \
  build-essential \
  ca-certificates \
  cmake \
  curl \
  debhelper \
  debsigs \
  devscripts \
  dh-systemd \
  docker-ce \
  dpkg-sig \
  expect \
  git \
  gnupg2 \
  librpm-dev \
  librrd-dev \
  libtool \
  make \
  nodejs \
  nsis \
  po-debconf \
  python \
  python3 \
  rpm \
  rpm2cpio \
  rpmlint \
  rsync \
  shellcheck \
  ssh \
  sudo \
  thin-provisioning-tools \
"

COPY ./debs /tmp/debs

RUN sudo /usr/local/bin/ghost-apt-install.sh ${PACKAGES}

RUN sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    sudo chmod +x /usr/local/bin/docker-compose

RUN if [ "$(ls -1 /tmp/debs/*.deb 2>/dev/null | wc -l)" != 0 ]; then dpkg -i /tmp/debs/*.deb; fi && \
    sudo rm -rf /tmp/debs

ARG BUILD_DATE="1970-01-01T00:00:00+0000"
ARG VERSION
ARG SOURCE
ARG REVISION
ARG BUILD_JOB_ID
ARG BUILD_NUMBER
ARG BUILD_URL
ARG BUILD_BRANCH

LABEL org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.title="OpenNMS Build Environment ${VERSION}" \
      org.opencontainers.image.source="${SOURCE}" \
      org.opencontainers.image.revision="${REVISION}" \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.vendor="The OpenNMS Group, Inc." \
      org.opencontainers.image.authors="OpenNMS Community" \
      org.opencontainers.image.licenses="AGPL-3.0" \
      org.opennms.image.base="${BASE_IMAGE}:${BASE_IMAGE_VERSION}" \
      org.opennme.cicd.jobid="${BUILD_JOB_ID}" \
      org.opennms.cicd.buildnumber="${BUILD_NUMBER}" \
      org.opennms.cicd.buildurl="${BUILD_URL}" \
      org.opennms.cicd.branch="${BUILD_BRANCH}"