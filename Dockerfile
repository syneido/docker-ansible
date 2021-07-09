FROM python:3.9.5-alpine3.13
ARG USER
ARG UID

RUN apk add --no-cache --virtual .compile_deps build-base python3-dev libffi-dev libressl-dev \
    && apk add --no-cache openssh-client rust cargo rsync\
    && pip install --upgrade pip cffi pycrypto \
    && pip install ansible \
    && apk del .compile_deps \
    && mkdir /.ansible && chmod o+w /.ansible \
    && adduser -D -H -h / -u "$UID" "$USER" \
    && apk add --no-cache make
