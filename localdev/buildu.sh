#!/usr/bin/env bash

set -oue pipefail

script_link=$(readlink -f "${0}")
script_dir=$(dirname "${script_link}")

IMAGE_NAME=sunchirp-os

docker kill ${IMAGE_NAME} || true
docker rm ${IMAGE_NAME} || true

docker build \
  --no-cache \
  --tag ${IMAGE_NAME} \
  --build-arg BASE_IMAGE=docker.io/library/ubuntu \
  --build-arg BASE_VERSION=22.04 \
  --file ${script_dir}/../Containerfile \
  ${script_dir}/../
