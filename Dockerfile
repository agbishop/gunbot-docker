FROM alpine:latest

RUN apk update && apk add  unzip wget

ARG GUNBOT_VERSION=v13
ENV GUNBOT_VERSION ${GUNBOT_VERSION}

RUN apk update \
 && apk add unzip wget 

WORKDIR /tmp
ADD https://github.com/GuntharDeNiro/BTCT/releases/download/${GUNBOT_VERSION}/lin.zip .

RUN unzip -q lin.zip \
 && rm -rf lin.zip \
 && rm -rf __MACOSX \
 && mv lin /gunbot \
 && rm /gunbot/config.js

WORKDIR /gunbot

EXPOSE 5000
VOLUME [ "/gunbot/backups", "/gunbot/logs", "/gunbot/json", "/gunbot/config.js", "/gunbot/gunbotgui.db"]

CMD /gunbot/gunthy-linux