# syntax=docker/dockerfile:1

# An application specific service base image for simple bash-forward services.
# Copyright (C) 2025 James Hanlon [mailto:jim@hanlonsoftware.com]
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

FROM bash:latest

ENV __1121CITRUS_BASE_DIR=/usr/local/1121citrus
ENV __1121CITRUS_BIN_DIR=${__1121CITRUS_BASE_DIR}/bin
ENV __1121CITRUS_INCLUDE_BASH_DIR=${__1121CITRUS_BASE_DIR}/include/bash
ENV BASH=/usr/local/bin/bash
ENV DEBIAN_FRONTEND=noninteractive

RUN APK_PACKAGES="aws-cli coreutils perl perl-utils php python3 py3-pip" \
    && set -Eeux -o pipefail \
    && echo [INFO] start installing ha-bash-base \
    && echo [INFO] installing apk packages: ${APK_PACKAGES} \
    && apk update \
    && apk add --no-cache ${APK_PACKAGES} \
    && echo [INFO] completed installing apk packages ... \
    && echo [INFO] make our bash the default shell \
    && ln --symbolic --force --verbose /usr/local/bin/bash /bin/bash \
    && ln --symbolic --force --verbose /usr/local/bin/bash /bin/sh \
    && echo [INFO] create 1121citrus file structure \
    && mkdir --parents --verbose ${__1121CITRUS_INCLUDE_BASH_DIR} \
    && mkdir --parents --verbose ${__1121CITRUS_BIN_DIR} \
    && echo [INFO] link 1121citrus initialization script into /etc/profile \
    && ln --symbolic --force --verbose  ${__1121CITRUS_INCLUDE_BASH_DIR}/dot-bashrc /etc/profile.d/1121citrus.sh \
    && ln --symbolic --force --verbose  ${__1121CITRUS_INCLUDE_BASH_DIR}/dot-bashrc /root/.bashrc \
    && echo [INFO] completed installing 1121citrus \
    && true

# Install Docker binary -- borrow it from Official Docker container
COPY --from=docker:latest --chmod=755 ./usr/local/bin/docker /usr/local/bin/docker

# Install common functions
COPY --chmod=755 ./src/include/bash/* ${__1121CITRUS_INCLUDE_BASH_DIR}
COPY --chmod=755 ./src/bin/* ${__1121CITRUS_BIN_DIR}

ENV BASH_ENV=/etc/profile
WORKDIR /

