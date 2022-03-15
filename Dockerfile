FROM docker.io/rsolano/alpine-vnc

COPY ./locale.md /locale.md

# Install language pack
#RUN echo 'http://mirrors.ustc.edu.cn/alpine/v3.5/main' > /etc/apk/repositories \
#    && echo 'http://mirrors.ustc.edu.cn/alpine/v3.5/community' >>/etc/apk/repositories \
RUN set -eux && sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk update \
    && apk add --update unrar && rm -rf /var/cache/apk/* \
    && apk add tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && apk del tzdata \
    && apk --no-cache add ca-certificates wget \
    && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-2.25-r0.apk \
        https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-bin-2.25-r0.apk \
        https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-i18n-2.25-r0.apk \
    && apk add glibc-bin-2.25-r0.apk glibc-i18n-2.25-r0.apk glibc-2.25-r0.apk \
    && sleep 3 \
    && cat /locale.md | xargs -i /usr/glibc-compat/bin/localedef -i {} -f UTF-8 {}.UTF-8 \
    && rm /etc/apk/keys/sgerrand.rsa.pub \
    && rm /locale.md \
        glibc-2.25-r0.apk \
        glibc-bin-2.25-r0.apk \
        glibc-i18n-2.25-r0.apk \
    && apk del wget  ca-certificates\
    && rm -rf /var/cache/apk/* \
    && rm "/root/.wget-hsts"  

ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN.UTF-8
