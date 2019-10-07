#!/bin/bash -e

# shellcheck disable=SC2034

# Overwrite project name on DockerHub
CONTAINER_PROJECT="openjdk"

# Base Image Dependency
BASE_IMAGE="opennms/centos"
BASE_IMAGE_VERSION="7.6.1810"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# Specific container config
JDK8_MAJOR_VERSION="1.8.0"
JDK8_VERSION_DETAIL="${JDK8_MAJOR_VERSION}.222.b10"

JDK11_MAJOR_VERSION="11"
JDK11_VERSION_DETAIL="${JDK11_MAJOR_VERSION}.0.4.11"

IMAGE_VERSION=("${JDK8_VERSION_DETAIL}-${JDK11_VERSION_DETAIL}")