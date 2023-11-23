#! /bin/bash

set -ouex pipefail

# Initial update and upgrade
echo "Installing Intel/AMD GPU Drivers..."
rpm-ostree install vulkan-loader vulkan-loader.i686

# other systemwide software
echo "Installing Intel/AMD GPU Drivers..."
rpm-ostree install conky htop vim jq openssh-server sshpass traceroute
