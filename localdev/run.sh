#! /bin/bash

set -ouex pipefail

script_link=$(readlink -f "${0}")
script_dir=$(dirname "${script_link}")

IMAGE_NAME=sunchirp-os

docker run -it \
  ${IMAGE_NAME} \
  bash
