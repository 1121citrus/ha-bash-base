# syntax=docker/dockerfile:1

ARG ALPINE_VERSION=3.22
ARG BASH_VERSION=5.3.0

FROM bash:${BASH_VERSION}-alpine${ALPINE_VERSION}

RUN APK_PACKAGES="aws-cli"  \
    && echo [INFO] start installing bash-base \
    && echo [INFO] installing apk packages: ${APK_PACKAGES} \
    && apk update \
    && apk add --no-cache ${APK_PACKAGES} \
    && echo [INFO] completed installing apk packages ... \
    && mkdir -pv /usr/local/include/bash \
    && echo [INFO] completed installing 1121citrus \
    && true

# Install Docker binary -- borrow it from Official Docker container
COPY --from=docker:latest --chmod=755 ./usr/local/bin/docker /usr/local/bin/docker

# Install common cruft
COPY --chmod=644 ./src/include/bash/common-functions /usr/local/include/bash/common-functions

WORKDIR /
ENTRYPOINT [ "/usr/bin/env", "bash", "-c" ]
CMD [ "/usr/bin/env", "bash", "-c" ]


