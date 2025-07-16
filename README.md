# 1121citrus/ha-bash-base

## Contents
- [1121citrus/ha-bash-base](#1121citrushome-assistantbash-base)
  - [Synopsis](#synopsis)
  - [Overview](#overview)
  - [Example](#example)

## Synopsis
An application specific service base image for simple bash-forward services.

## Overview

Recipe:

- Start with [stock bash image](https://hub.docker.com/_/bash/)
- Add selected bash include files to `/usr/local/include/bash`
- Add selected applications

## Example

```
# syntax=docker/dockerfile:1

FROM 1121citrus/ha-bash-base:latest

COPY --chmod=755 ./src/script /usr/local/bin/

ENTRYPOINT [ "/usr/local/bin/script" ]
```

