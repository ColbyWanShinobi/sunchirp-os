# These will be overridden by passed in values when built in the cloud
# quay.io/fedora-ostree-desktops/silverblue:39
# docker.io/library/ubuntu:22.04

ARG IMAGE_NAME="${IMAGE_NAME:-sunchirp-os}"
ARG BASE_IMAGE="${BASE_IMAGE:-quay.io/fedora-ostree-desktops/silverblue}"
ARG BASE_VERSION="${BASE_VERSION:-39}"

FROM ${BASE_IMAGE}:${BASE_VERSION} AS os-build

#Copy the setup folder onto the container
COPY os-config/* /tmp/os-config/

#Run the container setup
RUN /tmp/os-config/setup.sh

#Setup Third-Party Repositories
#RUN wget https://copr.fedorainfracloud.org/coprs/ublue-os/staging/repo/fedora-${BASE_VERSION}/ublue-os-staging-fedora-${BASE_VERSION}.repo -O /etc/yum.repos.d/_copr_ublue-os_staging.repo
#https://copr.fedorainfracloud.org/coprs/ublue-os/ucore/repo/fedora-39/ublue-os-ucore-fedora-39.repo
#https://copr.fedorainfracloud.org/coprs/ublue-os/distrobox-git/repo/fedora-39/ublue-os-distrobox-git-fedora-39.repo
#https://copr.fedorainfracloud.org/coprs/ublue-os/akmods/repo/fedora-39/ublue-os-akmods-fedora-39.repo
#https://copr.fedorainfracloud.org/coprs/ublue-os/gnome-software/repo/fedora-39/ublue-os-gnome-software-fedora-39.repo
#https://copr.fedorainfracloud.org/coprs/kylegospo/system76-scheduler/repo/fedora-39/kylegospo-system76-scheduler-fedora-39.repo
#https://copr.fedorainfracloud.org/coprs/kylegospo/grub-btrfs/repo/fedora-39/kylegospo-grub-btrfs-fedora-39.repo
#https://copr.fedorainfracloud.org/coprs/kylegospo/minecraft-server-hibernation/repo/fedora-39/kylegospo-minecraft-server-hibernation-fedora-39.repo
#https://copr.fedorainfracloud.org/coprs/kylegospo/obs-vkcapture/repo/fedora-39/kylegospo-obs-vkcapture-fedora-39.repo



#COPY github-release-install.sh \
#     install.sh \
#     post-install.sh \
#     packages.sh \
#     packages.json \
#        /tmp/

#COPY --from=ghcr.io/ublue-os/config:latest /rpms /tmp/rpms

#RUN wget https://copr.fedorainfracloud.org/coprs/ublue-os/staging/repo/fedora-$(rpm -E %fedora)/ublue-os-staging-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_ublue-os_staging.repo && \
#    wget https://copr.fedorainfracloud.org/coprs/kylegospo/oversteer/repo/fedora-$(rpm -E %fedora)/kylegospo-oversteer-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_kylegospo_oversteer.repo && \
#    /tmp/install.sh && \
#    /tmp/post-install.sh && \
#    rm -f /etc/yum.repos.d/_copr_ublue-os_staging.repo && \
#    rm -f /etc/yum.repos.d/_copr_kylegospo_oversteer.repo && \
#    rm -rf /tmp/* /var/* && \
#    ostree container commit && \
#    mkdir -p /var/tmp && chmod -R 1777 /var/tmp

#${{ env.BASE_DOMAIN }}/${{ env.BASE_DISTRO }}
#${BASE_DOMAIN}/${BASE_DISTRO}

#quay.io/fedora/silverblue:39
#docker.io/library/ubuntu:22.04
