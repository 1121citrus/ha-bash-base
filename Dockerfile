# syntax=docker/dockerfile:1

# Yet another version of `rotate-backups` but this time applied to an AWS S3 backup archive bucket.
# Copyright (C) 2005 James Hanlon [mailto:jim@hanlonsoftware.com]
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

ARG ALPINE_VERSION=3.22
ARG BASH_VERSION=5.3.0

FROM bash:${BASH_VERSION}-alpine${ALPINE_VERSION}

ENV DEBIAN_FRONTEND=noninteractive

ENV __HA_BASE_BASH_DIR=/usr/local/1121citrus/include/bash

RUN APK_PACKAGES="aws-cli coreutils perl perl-utils php" \
    && set -eux \
    && echo [INFO] start installing ha-bash-base \
    && echo [INFO] installing apk packages: ${APK_PACKAGES} \
    && apk update \
    && apk add --no-cache ${APK_PACKAGES} \
    && echo [INFO] completed installing apk packages ... \
    && mkdir -pv ${__HA_BASE_BASH_DIR} \
	&& ln -b -s ${__HA_BASE_BASH_DIR}/common-functions /etc/profile.d/1121citrus.sh \
    && echo [INFO] completed installing 1121citrus \
    && true

# Install Docker binary -- borrow it from Official Docker container
COPY --from=docker:latest --chmod=755 ./usr/local/bin/docker /usr/local/bin/docker

# Install common functions
COPY --chmod=755 ./src/include/bash/* ${__HA_BASE_BASH_DIR}

ENV BASH_ENV=/etc/profile
WORKDIR /
ENTRYPOINT [ "/usr/bin/env", "bash", "-c" ]

