#! /bin/bash

set -ouex pipefail

script_link=$(readlink -f "${0}")
script_dir=$(dirname "${script_link}")

IMAGE_NAME=sunchirp-os

docker kill ${IMAGE_NAME} || true
docker rm ${IMAGE_NAME} || true

docker build \
  --no-cache \
  --tag ${IMAGE_NAME} \
  --file ${script_dir}/../Containerfile \
  ${script_dir}/../
