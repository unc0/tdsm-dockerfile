FROM alpine:edge

MAINTAINER John Lin, <linnet9999+docker@gmail.com>

RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && apk update \
 && apk add mono openssl bash py-twisted

ADD tdsm-build-5.zip /tmp/

VOLUME /srv/tdsm/Worlds
VOLUME /srv/tdsm/Data
EXPOSE 7777 7023 2112

RUN mkdir -p /srv/tdsm /srv/tdsm/Worlds \
 && unzip /tmp/tdsm-build-5.zip -d /srv/tdsm  \
 && rm /tmp/tdsm-build-5.zip

WORKDIR /srv/tdsm

ADD run.sh /

ADD server.py /

ENTRYPOINT [ "/run.sh" ]
