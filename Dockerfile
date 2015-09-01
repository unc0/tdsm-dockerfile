FROM alpine:edge

MAINTAINER John Lin, <linnet9999+docker@gmail.com>

RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && apk update \
 && apk add mono openssl bash py-twisted

VOLUME /srv/tdsm/Worlds
VOLUME /srv/tdsm/Data
EXPOSE 7777 7023 2112

RUN mkdir -p /srv/tdsm /srv/tdsm/Worlds \
 && wget https://github.com/DeathCradle/Terraria-s-Dedicated-Server-Mod/releases/download/Build-5/tdsm-build-5.zip \
 && unzip tdsm-build-5.zip -d /srv/tdsm  \
 && rm tdsm-build-5.zip

WORKDIR /srv/tdsm

ADD run.sh /

ADD server.py /

ENTRYPOINT [ "/run.sh" ]
