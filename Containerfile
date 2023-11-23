#These will be overridden by passed in values when built in the cloud
ARG IMAGE_NAME="${IMAGE_NAME:-sunchirp-os}"
#ARG BASE_DOMAIN="${BASE_DOMAIN:-docker.io/library}"
#ARG BASE_ORG="${BASE_ORG}"
#ARG BASE_DISTRO="${IMAGE_NAME:-ubuntu}"
#

ARG BASE_IMAGE="${BASE_IMAGE:-docker.io/library/ubuntu}"
ARG BASE_VERSION="${BASE_VERSION:-22.04}"
#ARG SOURCE_IMAGE="${SOURCE_IMAGE:-silverblue}"
#ARG SOURCE_ORG="${SOURCE_ORG:-fedora-ostree-desktops}"
#ARG BASE_IMAGE="quay.io/${SOURCE_ORG}/${SOURCE_IMAGE}"
#ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-39}"

#FROM ${BASE_IMAGE}:${BASE_VERSION} AS birdnest
FROM ${BASE_IMAGE}:${BASE_VERSION} AS sunchirp-build
#ARG IMAGE_NAME="blueox-os"
#ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-39}"

COPY github-release-install.sh \
     install.sh \
     post-install.sh \
     packages.sh \
     packages.json \
        /tmp/

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
