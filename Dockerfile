FROM node:10.10-alpine
LABEL maintainer="chinaphper@qq.com"

ARG TZ="Asia/Shanghai"
ENV TZ ${TZ}

RUN apk add vips-dev fftw-dev --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk add git openssh binutils make g++ bash tzdata \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && rm -rf /var/cache/apk/*

CMD ["/bin/bash"]