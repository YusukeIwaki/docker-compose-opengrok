FROM alpine:3.10

RUN apk add --no-cache git
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

RUN apk add --no-cache --virtual .jiri-setup curl bash \
    && curl -s https://fuchsia.googlesource.com/jiri/+/master/scripts/bootstrap_jiri?format=TEXT | base64 -d | bash -s /usr/local/jiri \
    && ln -s /usr/local/jiri/.jiri_root/bin/jiri /usr/local/bin/jiri \
    && apk del .jiri-setup
