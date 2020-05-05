#!/bin/bash -e

# shellcheck disable=SC2034

# Configure base image dependency
BASE_IMAGE="debian"
VERSION="stretch"
BASE_IMAGE_VERSION="${VERSION}"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"
IMAGE_VERSION=("${VERSION}")

# Most specific tag when it is not build locally and in CircleCI
if [ -n "${CIRCLE_BUILD_NUM}" ]; then
  IMAGE_VERSION+=("${VERSION}-b${CIRCLE_BUILD_NUM}")
fi
