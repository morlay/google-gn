FROM debian:experimental as builder

ARG VERSION

RUN set -eux; \
    \
    apt-get update; \
    apt-get install -qqy --no-install-recommends \
        ca-certificates git \
        clang python ninja-build \
        libclang-dev libc++-dev \
        ; \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN set -eux; \
    \
    git clone https://gn.googlesource.com/gn; \
    cd gn; \
    git checkout ${VERSION}; \
    python build/gen.py; \
    ninja -v -C out; \
    out/gn_unittests;

FROM alpine

COPY --from=builder  /tmp/gn/out/gn /gn/gn
